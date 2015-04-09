class AddImageInfoToPictures < ActiveRecord::Migration
  def change
    add_column :photos_pictures, :image_uid, :string
    add_column :photos_pictures, :image_name, :string
    remove_column :photos_pictures, :image
  end
end
