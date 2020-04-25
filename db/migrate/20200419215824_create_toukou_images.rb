class CreateToukouImages < ActiveRecord::Migration[5.2]
  def change
    create_table :toukou_images do |t|
      t.text :image
      t.integer :item_id, foreign_key: true
      t.timestamps
    end
  end
end
