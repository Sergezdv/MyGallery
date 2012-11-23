class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.float :user_id
      t.float :picture_id

      t.timestamps
    end
  end
end
