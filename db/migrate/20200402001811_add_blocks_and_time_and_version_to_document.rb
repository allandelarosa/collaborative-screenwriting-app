class AddBlocksAndTimeAndVersionToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :time, :integer
    add_column :documents, :blocks, :text
    add_column :documents, :version, :string
  end
end
