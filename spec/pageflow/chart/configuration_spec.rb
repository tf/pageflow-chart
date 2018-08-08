require 'spec_helper'

module Pageflow
  module Chart
    describe Configuration do
      describe 'paperclip_options' do
        it 'returns hash with path option for file with given extension' do
          configuration = Configuration.new

          result = configuration.paperclip_options(extension: 'js')

          expect(result[:path]).to eq(':pageflow_s3_root/:class/:id_partition/all.js')
        end

        it 'allows to override basename of path option' do
          configuration = Configuration.new

          result = configuration.paperclip_options(basename: 'some', extension: 'js')

          expect(result[:path]).to eq(':pageflow_s3_root/:class/:id_partition/some.js')
        end

        it 'uses paperclip_base_path as prefix' do
          configuration = Configuration.new
          configuration.paperclip_base_path = 'main'

          result = configuration.paperclip_options(basename: 'some', extension: 'js')

          expect(result[:path]).to eq('main/:class/:id_partition/some.js')
        end

        it 'returns hash with s3_headers option with matching content type for js' do
          configuration = Configuration.new

          result = configuration.paperclip_options(extension: 'js')

          expect(result[:s3_headers]['Content-Type']).to eq('application/javascript')
        end

        it 'returns hash with s3_headers option with matching content type for css' do
          configuration = Configuration.new

          result = configuration.paperclip_options(extension: 'css')

          expect(result[:s3_headers]['Content-Type']).to eq('text/css')
        end
      end
    end
  end
end
