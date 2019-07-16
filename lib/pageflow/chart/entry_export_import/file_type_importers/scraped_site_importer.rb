module Pageflow
  module Chart
    module EntryExportImport
      module FileTypeImporters
        class ScrapedSiteImporter
          def self.import_file(file_data)
            ScrapedSite.create!(file_data.except('id', 'updated_at'))
          end

          def self.upload_files(collection_directory, file_mappings)
            Dir.foreach(collection_directory) do |exported_id|
              next if exported_id == '.' or exported_id == '..'

              attachments_directory_path = File.join(collection_directory,
                                                     exported_id)

              scraped_site_id = ImportUtils.file_id_for_exported_id(file_mappings,
                                                                    'Pageflow::Chart::ScrapedSite',
                                                                    exported_id)

              UploadAttachmentsJob.perform_later('Pageflow::Chart::ScrapedSite',
                                                 scraped_site_id,
                                                 attachments_directory_path)
            end
          end
        end
      end
    end
  end
end
