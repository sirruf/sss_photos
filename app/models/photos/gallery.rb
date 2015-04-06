module Photos
  class Gallery < ActiveRecord::Base
    validates :name, presence: true
    has_many :pictures, :dependent => :destroy
    scope :published, -> { where(published: true) }
    belongs_to :resource, polymorphic: true

    def self.galleries_matrix(divisible_by = 3)
      if published.with_pictures.count % divisible_by == 0
        published.with_pictures.limit(12)
      else
        published.with_pictures
      end
    end

    def self.with_pictures
      where(id: select { |m| m.have_images? }.map(&:id))
    end

    def self.without_resource
      where(resource_id: nil)
    end

    def main_picture(orientation = nil)
      if orientation == 'landscape'
        pictures.where(orientation: orientation).first if have_images?
      else
        pictures.first if have_images?
      end
    end

    def have_images?
      pictures.count > 0
    end
  end
end
