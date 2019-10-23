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

          expect(downloader).to receive(:load_following_refresh_tags)
            .with('http://example.com',
                  raise_on_http_error: true)

          job.perform_with_result(scraped_site, {}, downloader: downloader)
        end

        it 'returns :error on HTTP error' do
          job = ScrapeSiteJob.new
          scraped_site = create(:scraped_site, url: 'http://example.com/a')

          stub_request(:get, 'http://example.com/a').to_return(status: 404, body: '')

          result = job.perform_with_result(scraped_site)

          expect(result).to eq(:error)
        end
      end
    end
  end
end
