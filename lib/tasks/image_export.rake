namespace :paperclip do
  desc "Recreate attachments and save them to new destination"
  task :move_attachments => :environment do

    Post.find_each do |post|
      unless post.image_file_name.blank?
        filename = Rails.root.join('public', 'system', 'images', post.id.to_s, 'original', post.image_file_name)

        if File.exists? filename
          puts "Re-saving image attachment #{post.id} - #{filename}"
          image = File.new filename
          post.image = image
          post.save
          # if there are multiple styles, you want to recreate them :
          post.image.reprocess! 
          image.close
        end
      end
    end
  end
end