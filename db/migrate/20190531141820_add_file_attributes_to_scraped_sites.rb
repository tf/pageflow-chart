class AddFileAttributesToScrapedSites < ActiveRecord::Migration[5.2]
  def change
    add_reference :pageflow_chart_scraped_sites, :entry, index: true
    add_column :pageflow_chart_scraped_sites, :rights, :string
    add_column :pageflow_chart_scraped_sites, :parent_file_id, :integer
    add_column :pageflow_chart_scraped_sites, :parent_file_model_type, :string
  end
end
