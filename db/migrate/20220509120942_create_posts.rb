class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer "member_id"
      t.integer "favorite_id"
      t.string "title"
      t.text "introduction"
      t.string "machine"

      t.timestamps
    end
  end
end
