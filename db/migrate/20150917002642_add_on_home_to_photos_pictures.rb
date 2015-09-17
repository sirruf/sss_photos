class AddOnHomeToPhotosPictures < ActiveRecord::Migration
  def change
    add_column :photos_pictures, :on_home, :boolean, default: false
  end
end
