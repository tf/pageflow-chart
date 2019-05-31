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

    var scrapedSiteId = this.model.get(this.options.propertyName);

    if (scrapedSiteId) {
      this.scrapedSite = pageflow
        .entry
        .getFileCollection('pageflow_chart_scraped_sites')
        .get(scrapedSiteId);

      this.updateAttributes();
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
