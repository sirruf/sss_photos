class RemoveSizesFromPictures < ActiveRecord::Migration
  def change
    remove_column :photos_pictures, :height
    remove_column :photos_pictures, :width
  end
end

