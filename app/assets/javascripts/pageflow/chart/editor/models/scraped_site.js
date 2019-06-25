pageflow.chart.ScrapedSite = pageflow.ReusableFile.extend({
  stages: [
    {
      name: 'processing',
      activeStates: ['processing'],
      finishedStates: ['processed'],
      failedStates: ['processing_failed']
    }
  ],

  readyState: 'processed',

  toJSON: function() {
    return _.pick(this.attributes, 'url');
  }
});
