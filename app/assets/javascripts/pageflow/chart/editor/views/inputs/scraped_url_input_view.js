pageflow.chart.ScrapedUrlInputView = pageflow.UrlInputView.extend({
  className: 'chart_scraped_site_url_input_view',

  save: function() {
    var url = this.ui.input.val();

    if (url) {
      var scrapedSite = pageflow
        .entry
        .getFileCollection('pageflow_chart_scraped_sites')
        .findOrCreateBy({url: url});

      if (scrapedSite.isRetryable()) {
        scrapedSite.retry();
      }

      this.model.setReference(
        this.options.propertyName,
        scrapedSite
      );
    }
    else {
      this.model.unsetReference(
        this.options.propertyName
      );
    }
  }
});
