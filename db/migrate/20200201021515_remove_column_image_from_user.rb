class RemoveColumnImageFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image, :binary
  end
end
