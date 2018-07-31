module PageflowChart
  class InstallGenerator < Rails::Generators::Base
    desc 'Install the Pageflow plugin and the necessary migrations.'

    def register_plugin
      inject_into_file('config/initializers/pageflow.rb',
                       after: "Pageflow.configure do |config|\n") do

        "  config.page_types.register(Pageflow::Chart.page_type)\n"
      end
    end

    def mount_engine
      route("mount Pageflow::Chart::Engine, at: '/charts'\n")
    end

    def install_migrations
      rake 'pageflow_chart:install:migrations'
    end
  end
end
