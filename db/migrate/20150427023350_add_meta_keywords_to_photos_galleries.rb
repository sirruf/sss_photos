class AddMetaKeywordsToPhotosGalleries < ActiveRecord::Migration
  def change
    add_column :photos_galleries, :meta_keywords, :text
  end
end
