module Photos
  class Picture < ActiveRecord::Base
    belongs_to :gallery
    acts_as_list scope: :gallery

    dragonfly_accessor :image
    #mount_uploader :image, ImagesUploader

    default_scope  { order(:position) }

    def self.random_images(count = 3)
      where.not(gallery_id: nil).sample(count)
    end

    validates :image, presence: true

    validates :image, presence: true
    validates_size_of :image, maximum: 3.megabytes,
                      message: 'should be no more than 500 KB', if: :image_changed?

    validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                       message: 'should be either .jpeg, .jpg, .png, .bmp', if: :image_changed?
  end
end
