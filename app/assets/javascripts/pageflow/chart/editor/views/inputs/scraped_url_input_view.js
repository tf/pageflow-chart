pageflow.chart.ScrapedUrlInputView = pageflow.UrlInputView.extend({
  save: function() {
    var url = this.ui.input.val();

    if (url) {
      this.model.setReference(
        this.options.propertyName,
        pageflow
          .entry
          .getFileCollection('pageflow_chart_scraped_sites')
          .findOrCreateBy({url: url})
      );
    }
    else {
      this.model.unsetReference(
        this.options.propertyName
      );
    }
  }
});
