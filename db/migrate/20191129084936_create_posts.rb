class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title,        null: false
      t.binary :image
      t.text   :text,         null: false
      t.timestamps
    end
  end
end
