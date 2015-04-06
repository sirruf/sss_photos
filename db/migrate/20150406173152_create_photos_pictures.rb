class CreatePhotosPictures < ActiveRecord::Migration
  def change
    create_table :photos_pictures do |t|
      t.string :name
      t.integer :position
      t.string :image
      t.integer :gallery_id
      t.string :width
      t.string :height

      t.timestamps
    end
  end
end
