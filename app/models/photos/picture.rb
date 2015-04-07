module Photos
  class Picture < ActiveRecord::Base
    belongs_to :gallery
    acts_as_list scope: :gallery

    mount_uploader :image, ImagesUploader

    default_scope  { order(:position) }

    def self.random_images(count = 3)
      where.not(gallery_id: nil).sample(count)
    end

    def self.landscape
      where(id: select { |m| m.orientation == 'landscape' }.map(&:id))
    end

    def self.portrait
      where(id: select { |m| m.orientation == 'portrait' }.map(&:id))
    end

    def orientation
      self.height > self.width ? 'portrait' : 'landscape'
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
  end
end
