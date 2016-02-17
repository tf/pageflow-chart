require 'pageflow-public-i18n'

module Pageflow
  module Chart
    class Engine < Rails::Engine
      isolate_namespace Pageflow::Chart

      config.autoload_paths << File.join(config.root, 'lib')
      config.assets.precompile += ['pageflow/chart/custom.css', 'pageflow/chart/transparent_background.css']

      config.generators do |g|
        g.test_framework :rspec,:fixture => false
        g.fixture_replacement :factory_girl, :dir => 'spec/factories'
        g.assets false
        g.helper false
      end
    end
  end
end
