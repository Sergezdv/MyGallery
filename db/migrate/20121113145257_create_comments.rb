class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.integer :user_id
      t.integer :picture_id
      t.references :picture

      t.timestamps
    end
  end
end
