require 'spec_helper'

module Pageflow
  module Chart
    describe ScrapeSiteJob do
      describe '#perform' do
        it 'scrapes html' do
          scraper = double('Scraper', html: '<html>rewritten</html>')
          downloader = double('Downloader', load: '<html>original</html>')
          job = ScrapeSiteJob.new
          scraped_site = create(:scraped_site, url: 'http://example.com')

          allow(Scraper).to receive(:new).and_return(scraper)

          expect(downloader).to receive(:load_following_refresh_tags).with('http://example.com')

          job.perform_with_result(scraped_site, {}, downloader: downloader)
        end
      end
    end
  end
end
