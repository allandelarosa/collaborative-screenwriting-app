class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :script_id
      t.integer :timestamp
      t.integer :order
      t.string :type
      t.text :text

      t.timestamps
    end
  end
end
