module Photos
  class Picture < ActiveRecord::Base
    belongs_to :gallery
    acts_as_list scope: :gallery

    mount_uploader :image, ImagesUploader
    before_save :update_orientation

    default_scope  { order(:position) }

    def self.random_images(count = 3)
      where.not(gallery_id: nil).sample(count)
    end

    def self.landscape
      where(orientation: 'landscape')
    end

    def self.portrait
      where(orientation: 'portrait')
    end

    def available_versions
      result = []
      Picture.available_versions.each do |version|
        #result << version if self.image.url(version[0].to_sym).exist?
        result << self.image.thumb.file.exists?
      end
      result
    end

    def self.available_versions
      [
          %w(thumb compress),
          %w(home_gallery home),
          %w(news_top_thumb newspapper-o),
          %w(home_slider sliders)
      ].sort
    end

    private

    def update_orientation
      self.orientation = self.height > self.width ? 'portrait' : 'landscape'
    end
  end
end
