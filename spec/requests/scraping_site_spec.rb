require 'spec_helper'

module Pageflow
  module Chart
    describe 'scraping site', perform_jobs: true do
      before do
        stub_request(:get, "http://example.com/chart.html")
          .to_return(:status => 200, :body => File.read('spec/fixtures/datawrapper.html'))
        stub_request(:get, /js$|css$|csv$/)
          .to_return(:status => 200, :body => 'file')
      end

      it 'downloads html and dependencies' do
        post('/charts/scraped_sites.json', params: {scraped_site: {url: 'http://example.com/chart.html'}})

        expect(ScrapedSite.first.html_file).to be_present
        expect(ScrapedSite.first.javascript_file).to be_present
        expect(ScrapedSite.first.stylesheet_file).to be_present
        expect(ScrapedSite.first.csv_file).to be_present
      end
    end
  end
end
