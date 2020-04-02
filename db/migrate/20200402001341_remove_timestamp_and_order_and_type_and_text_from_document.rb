class RemoveTimestampAndOrderAndTypeAndTextFromDocument < ActiveRecord::Migration[6.0]
  def change

    remove_column :documents, :timestamp, :integer

    remove_column :documents, :order, :integer

    remove_column :documents, :type, :string

    remove_column :documents, :text, :text
  end
end
