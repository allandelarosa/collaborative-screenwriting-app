class AddAuthorToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :author, :string
  end
end
