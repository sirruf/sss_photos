class CreatePhotosGalleries < ActiveRecord::Migration
  def change
    create_table :photos_galleries do |t|
      t.string :name
      t.text :description
      t.boolean :published
      t.string :resource_type
      t.integer :resource_id

      t.timestamps
    end
  end
end
