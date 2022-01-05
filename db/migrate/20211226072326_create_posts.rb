class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.string :body
      t.timestamps
    end
  end
end
