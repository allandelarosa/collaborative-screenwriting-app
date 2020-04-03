class AddJsonToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :json, :text
  end
end
