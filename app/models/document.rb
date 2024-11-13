class Document < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_rich_text :rich_text
end
