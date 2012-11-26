class ChangeNameToComments < ActiveRecord::Migration

  def change
    rename_column(:comments, :name, :title)
  end

end
