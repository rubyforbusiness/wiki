class Document::Query
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title_contains, :string

  def initialize(...)
    super
  end

  def results
    if valid?
      sort_documents.then { filter_documents(_1) }
    else
      []
    end
  end

  private

  def sort_documents(scope = Document.all)
    scope.order("title asc")
  end

  def filter_documents(scope)
    filter_by_title(scope)
  end

  def filter_by_title(scope)
    if (title = title_contains.presence)
      scope.where("title LIKE ?", "%#{title}%")
    else
      scope
    end
  end
end