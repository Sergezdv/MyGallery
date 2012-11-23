class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.float :category_id

      t.timestamps
    end
  end
end
