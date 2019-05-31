require 'spec_helper'
require 'pageflow/lint'

module Pageflow
  module Chart
    Pageflow::Lint.file_type(:scraped_site,
                             create_file_type: -> { Chart.scraped_site_file_type },
                             create_file: -> { create(:scraped_site) })
  end
end
