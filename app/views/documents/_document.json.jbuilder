json.extract! document, :id, :title, :rich_text, :created_at, :updated_at
json.url document_url(document, format: :json)
