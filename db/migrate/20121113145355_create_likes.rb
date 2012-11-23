class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.float :user_id
      t.float :picture_id

      t.timestamps
    end
  end
end
