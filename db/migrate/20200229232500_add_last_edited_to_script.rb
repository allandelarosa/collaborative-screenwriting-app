class AddLastEditedToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :last_edited, :string
  end
end
