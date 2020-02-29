class AddTitleToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :title, :string
  end
end
