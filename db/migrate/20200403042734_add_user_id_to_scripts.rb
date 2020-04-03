class AddUserIdToScripts < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :user_id, :integer
  end
end
