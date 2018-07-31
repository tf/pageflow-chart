class CreatePageflowChartScrapedSites < ActiveRecord::Migration[4.2]
  def change
    create_table :pageflow_chart_scraped_sites do |t|
      t.string :url
      t.string :state
      t.attachment :html_file
      t.attachment :javascript_file
      t.attachment :stylesheet_file
      t.attachment :csv_file

      t.timestamps
    end
  end
end
