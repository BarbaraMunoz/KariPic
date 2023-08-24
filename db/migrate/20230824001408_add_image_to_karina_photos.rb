class AddImageToKarinaPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :karina_photos, :image, :string
  end
end
