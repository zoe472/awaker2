class ChangeToukouImagesToToukouimages < ActiveRecord::Migration[5.2]
  def change
    rename_table :toukou_images, :toukouimages
  end
end
