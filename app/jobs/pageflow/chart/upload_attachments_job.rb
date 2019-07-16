module Pageflow
  module Chart
    class UploadAttachmentsJob < ActiveJob::Base
      queue_as :file_upload

      def perform(model, file_id, local_files_directory)
        file = model.constantize.find(file_id)
        file.attachments_for_export.each do |attachment|
          exported_attachment = file.send(attachment.name)
          file_name = file.send("#{exported_attachment.name}_file_name")
          local_file_path = File.join(local_files_directory, file_name)
          bucket = exported_attachment.s3_bucket
          obj = bucket.object(exported_attachment.path)
          obj.upload_file(local_file_path)
        end
      end
    end
  end
end
