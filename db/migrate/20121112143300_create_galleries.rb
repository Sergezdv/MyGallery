class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name

      t.timestamps
    end
    #add_index :gallery, :name
  end
end
