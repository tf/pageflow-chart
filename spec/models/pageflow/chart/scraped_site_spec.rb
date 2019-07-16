require 'spec_helper'

module Pageflow::Chart
  describe ScrapedSite do
    describe '#csv_url' do
      it 'replaces base filename of url with data.csv' do
        scraped_site = ScrapedSite.new(url: 'http://example.com/foo/index.html')

        expect(scraped_site.csv_url).to eq('http://example.com/foo/data.csv')
      end

      it 'appends data.csv to directory url' do
        scraped_site = ScrapedSite.new(url: 'http://example.com/foo/')

        expect(scraped_site.csv_url).to eq('http://example.com/foo/data.csv')
      end
    end

    it 'copies use_custom_theme flag from config on create' do
      Pageflow::Chart.config.use_custom_theme = true
      scraped_site_with_custom_theme = create(:scraped_site)

      Pageflow::Chart.config.use_custom_theme = false
      scraped_site_without_custom_theme = create(:scraped_site)

      expect(scraped_site_with_custom_theme.use_custom_theme).to eq(true)
      expect(scraped_site_without_custom_theme.use_custom_theme).to eq(false)
    end

    it 'exposes all attachments for export' do
      scraped_site = ScrapedSite.new(url: 'http://example.com/foo/index.html')

      expect(scraped_site.attachments_for_export.map(&:name))
        .to eq(%i[javascript_file stylesheet_file html_file csv_file])
    end
  end
end
