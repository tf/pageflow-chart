# Pageflow Chart

Page type showing scraped svg diagramms from Datawrapper.

## Installation

Add this line to your application's Gemfile:

    # Gemfile
    gem 'pagflow-chart'

Mount the engine:

    # config/routes.rb
    mount Pageflow::Chart::Engine, :at => '/chart'

Register the page type:

    # config/initializers/pageflow.rb
    config.register_page_type(Pageflow::Chart.page_type)

Include javascript/stylesheets:

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

Install and run migrations:

    rake pageflow_chart:install:migrations
    rake db:migrate SCOPE=pageflow_chart

## Create Proxy

Create a proxy (via Apache, Nginx, ...) from your domain to your configured
`S3_HOST_ALIAS` to circumvent the same-domain policy. Configure this
in your Pageflow Chart initializer `config/initializers/pageflow_chart.rb`.

Example conf snippet for Nginx:

    location /datawrapper/ {
      proxy_pass http://bucketname.s3-website-eu-west-1.amazonaws.com/;
      proxy_redirect http://bucketname.s3-website-eu-west-1.amazonaws.com/ $scheme://$host/datawrapper/;
    }

This is needed so the charts can be servered from the same origin as
the entry.

## Configuration

Configure Pageflow Chart by creating an initializer in your app
`config/initializers/pageflow_chart.rb`.

Example:

    Pageflow::Chart.configure do |config|
      config.scraped_sites_root_url = '/datawrapper'
    end

Please see `lib/pageflow/chart/configuration.rb` for the possible options.

TODO: Document config options here

## Troubleshooting

If you run into problems while installing the page type, please also
refer to the
[Troubleshooting](https://github.com/codevise/pageflow/wiki/Troubleshooting)
wiki page in the
[Pageflow repository](https://github.com/codevise/pageflow). If that
doesn't help, consider
[filing an issue](https://github.com/codevise/pageflow-chart/issues).

## Contributing Locales

Edit the translations directly on the
[pageflow-chart](http://www.localeapp.com/projects/public?search=tf/pageflow-chart)
locale project.
