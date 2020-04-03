class RemoveEmailFromScripts < ActiveRecord::Migration[6.0]
  def change

    remove_column :scripts, :email, :string
  end
end
