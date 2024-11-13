class Document < ApplicationRecord
  validates :title, uniqueness: true, presence: true
end
