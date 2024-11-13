class DropRichTextColumnFromDocuments < ActiveRecord::Migration[8.1]
  def change
    remove_column :documents, :rich_text
  end
end
