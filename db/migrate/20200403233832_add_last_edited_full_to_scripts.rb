class AddLastEditedFullToScripts < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :last_edited_full, :string
  end
end
