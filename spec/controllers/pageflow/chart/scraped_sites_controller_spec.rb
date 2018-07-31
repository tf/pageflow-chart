require 'spec_helper'

module Pageflow
  module Chart
    describe ScrapedSitesController do
      describe '#create' do
        routes { Pageflow::Chart::Engine.routes }

        it 'responds with success' do
          post(:create, params: {scraped_site: {url: "http://example.com/chart.html"}}, format: 'json')

          expect(response.status).to eq(201)
        end

        it 'creates scraped site' do
          expect {
            post(:create, params: {scraped_site: {url: "http://example.com/chart.html"}}, format: 'json')
          }.to change { ScrapedSite.count }
        end
      end

      describe '#show' do
        routes { Pageflow::Chart::Engine.routes }

        it 'responds with success' do
          scraped_site = create(:scraped_site, state: 'unprocessed')

          get(:show, params: { id: scraped_site.id }, format: 'json')

          expect(response.status).to eq(200)
        end
      end
    end
  end
end
