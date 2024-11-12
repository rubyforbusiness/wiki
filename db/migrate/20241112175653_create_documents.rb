class CreateDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.json :rich_text

      t.timestamps
    end
    add_index :documents, :title, unique: true
  end
end
