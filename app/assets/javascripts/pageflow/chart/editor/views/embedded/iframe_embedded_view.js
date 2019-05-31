pageflow.chart.IframeEmbeddedView = Backbone.Marionette.View.extend({
  modelEvents: {
    'change': 'update'
  },

  render: function() {
    this.updateScrapedSite();
    return this;
  },

  update: function() {
    if (this.model.hasChanged(this.options.propertyName)) {
      this.updateScrapedSite();
    }
  },

  updateScrapedSite: function() {
    if (this.scrapedSite) {
      this.stopListening(this.scrapedSite);
    }

    this.scrapedSite = this.model.getReference(this.options.propertyName,
                                               'pageflow_chart_scraped_sites');
    this.updateAttributes();

    if (this.scrapedSite) {
      this.listenTo(this.scrapedSite, 'change', this.updateAttributes);
    }
  },

  updateAttributes: function() {
    var scrapedSite = this.scrapedSite;

    if (scrapedSite && scrapedSite.isReady()) {
      this.$el.attr('src', scrapedSite.get('html_file_url'));

      if (scrapedSite.get('use_custom_theme')) {
        this.$el.attr('data-use-custom-theme', 'true');
      }
      else {
        this.$el.removeAttr('data-use-custom-theme');
      }
    }
    else {
      this.$el.attr('src', '');
    }
  }
});
