class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :brandname, null: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
