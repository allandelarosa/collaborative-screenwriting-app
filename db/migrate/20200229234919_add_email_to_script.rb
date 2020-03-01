class AddEmailToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :email, :string
  end
end
