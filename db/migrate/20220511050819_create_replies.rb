class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.text :response
      t.integer :post_id
      t.integer :member_id

      t.timestamps
    end
  end
end
