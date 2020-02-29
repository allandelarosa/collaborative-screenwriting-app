class CreateScripts < ActiveRecord::Migration[6.0]
  def change
    create_table :scripts do |t|

      t.timestamps
    end
  end
end
