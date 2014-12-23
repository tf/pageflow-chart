# Pageflow Chart

Page type showing scraped svg diagramms from Datawrapper.

## Installation

### Add this line to your application's Gemfile:

    # Gemfile
    gem 'pagflow-chart'

### Mount the engine:

    # config/routes.rb
    mount Pageflow::Chart::Engine, :at => '/chart'

### Register the page type:

    # config/initializers/pageflow.rb
    config.register_page_type(Pageflow::Chart::PageType.new)

### Include javascript/stylesheets:

    # app/assets/javascripts/pageflow/application.js
    //= require "pageflow/chart"

    # app/assets/javascripts/pageflow/editor.js
    //= require pageflow/chart/editor

    # app/assets/stylesheets/pageflow/application.scss.css;
    @import "pageflow/chart";


    # app/assets/stylesheets/pageflow/editor.scss.css;
    @import "pageflow/chart/editor";

    # Adding basic style to your theme
    # app/assets/stylesheets/pageflow/themes/default.css.scss
    @import "pageflow/chart/themes/default";


### Create Proxy

Create a proxy (via Apache, Nginx, ...) from your domain to your configured
`S3_HOST_ALIAS` to circumvent the same-domain policy. Configure this
in your Pageflow Chart initializer `config/initializers/pageflow_chart.rb`.

Example conf snippet for Nginx:

    location /datawrapper/ {
      proxy_pass http://bucketname.s3-website-eu-west-1.amazonaws.com/;
      proxy_redirect http://bucketname.s3-website-eu-west-1.amazonaws.com/ $scheme://$host/datawrapper/;
    }

### Install and run migrations:

    rake pageflow_chart:install:migrations
    rake db:migrate SCOPE=pageflow_chart

## Configuration

Configure Pageflow Chart by creating an initializer in your app
`config/initializers/pageflow_chart.rb`.

Example:

    Pageflow::Chart.configure do |config|
      config.scraped_sites_root_url = '/datawrapper'
    end

Please see `lib/pageflow/chart/configuration.rb` for the possible options.

TODO: Document config options here
