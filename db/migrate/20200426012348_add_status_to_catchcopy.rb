class AddStatusToCatchcopy < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :catchcopy, :string
  end
end
