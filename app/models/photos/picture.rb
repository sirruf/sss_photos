module Photos
  class Picture < ActiveRecord::Base
    belongs_to :gallery
    acts_as_list scope: :gallery

    dragonfly_accessor :image
    attr_accessor :image_size

    validates :image, presence: true

    validates :image, presence: true
    validates_size_of :image, maximum: 3.megabytes,
                      message: 'не должно привышать 3 MB', if: :image_changed?

    validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                       message: 'должно быть в формате .jpeg, .jpg, .png, .bmp', if: :image_changed?

    # default_scope { order(:position) }
    scope :publushed_on_home, -> { where(on_home: true) }

    def self.random_images(count = 3)
      where.not(gallery_id: nil).sample(count)
    end


    def orientation
      if image.landscape?
        :landscape
      elsif image.portrait?
        :portrait
      else
        :square
      end
    end

  end
end
