# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   process :resize_to_limit => [600, 600]

   version :origin do
     process :resize_to_limit => [600, 600]
   end

   version :thumb do
     process :resize_to_limit => [200, 200]
   end

   version :thumb_f do
     process :resize_to_fill => [128, 128]
   end

   version :small do
     process :resize_to_limit => [100, 100]
   end

   version :with_border do
     process :make_thumb
   end



   private
   def make_thumb
     resize_to_fill(128,128)
     round_corner
   end

   #def draw_border
   #  manipulate! do |image|
   #    image.frame "5x5" # рамка с толщиной 5 пикселей в вертикальном и горизонтальном положениях
   #    image
   #  end
   #end

   # скругление углов
   def round_corner(radius = 10)
     round_command = ""
     round_command << '\( +clone -alpha extract '
     round_command << "-draw 'fill black polygon 0,0 0,#{radius} #{radius},0 fill white circle #{radius},#{radius} #{radius},0' "
     round_command << '\( +clone -flip \) -compose Multiply -composite '
     round_command << '\( +clone -flop \) -compose Multiply -composite \) '
     round_command << '-alpha off -compose CopyOpacity -composite'
     manipulate! do |image|
       image.format 'png'
       image.combine_options :convert do |command|
         command << round_command
       end
       image
     end
   end



  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
