# encoding: utf-8
module Photos
  class ImagesUploader < CarrierWave::Uploader::Base

    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick
    process :store_dimensions

    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
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
    #   process resize_to_fit: [64, 64]
    #   process crop: '64x64+0+0'
    #   # process :resize_to_fit => [50, 50]
    # end



    # version :photo_of_the_week, :if => :landscape? do
    #   process :resize_to_fit => [520, 390]
    # end
    # version :photo_of_the_week_portrait, :if => :portrait? do
    #   process :resize_to_fit => [293, 390]
    # end

    version :thumb do
      process :resize_to_fit => [1000, 1000]
      resize_to_fill(250, 250, gravity='Center')
    end

    version :news_top_thumb do
      process :resize_to_fit => [1000, 1000]
      resize_to_fill(65, 65, gravity='Center')
    end

    version :home_gallery do
      process :resize_to_fit => [1000, 1000]
      resize_to_fill(380, 380, gravity='Center')
    end
    # (default: 'Center'; options: 'NorthWest', 'North', 'NorthEast', 'West', 'Center', 'East', 'SouthWest', 'South', 'SouthEast')
    version :home_slider, :if => :landscape? do
      #process :resize_to_fit => [1400, 1400]
      resize_to_fill(1400, 760, gravity='Center')
    end

    version :home_slider_wo_resize, :if => :landscape? do
      resize_to_fill(1400, 700, gravity='Center')
    end

    version :news_slider, :if => :landscape? do
      process :resize_to_fit => [1400, 1400]
      resize_to_fill(850, 480, gravity='Center')
    end

    # version :big, :if => :landscape? do
    #   process :resize_to_fit => [800, 600]
    # end
    # version :big_portrait, :if => :portrait? do
    #   process :resize_to_fit => [450, 600]
    # end


    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png)
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end

    private

    def landscape? picture
      image = MiniMagick::Image.open(picture.path)
      image[:width] > image[:height]
    end



    def portrait? img
      ! landscape?(img)
    end

    def store_dimensions
      if file && model
        model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
      end
    end

    def crop(geometry)
      manipulate! do |img|
        img.crop(geometry)
        img
      end
    end

    def resize_and_crop(size)
      manipulate! do |image|
        if image[:width] < image[:height]
          remove = ((image[:height] - image[:width])/2).round
          image.shave("0x#{remove}")
        elsif image[:width] > image[:height]
          remove = ((image[:width] - image[:height])/2).round
          image.shave("#{remove}x0")
        end
        image.resize("#{size}x#{size}")
        image
      end
    end
  end
end
