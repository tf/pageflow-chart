pageflow.editor.fileTypes.register('pageflow_chart_scraped_sites', {
  model: pageflow.chart.ScrapedSite,

  matchUpload: function(upload) {
    return false;
  }
});
