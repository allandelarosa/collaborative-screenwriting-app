class RemoveBlocksAndTimeAndVersionFromDocument < ActiveRecord::Migration[6.0]
  def change

    remove_column :documents, :blocks, :text

    remove_column :documents, :version, :string

    remove_column :documents, :time, :integer
  end
end
