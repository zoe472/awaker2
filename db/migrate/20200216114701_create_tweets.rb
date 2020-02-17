class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :text
      t.text :image
      t.string :category
      t.timestamps
    end
  end
end
