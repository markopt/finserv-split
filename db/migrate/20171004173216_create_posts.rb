class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :password

      t.timestamps
    end
  end
end
