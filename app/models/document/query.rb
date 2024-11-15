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
    if (title_query = title_contains.presence)
      title_query.split(" ").each_with_index do |word, index|
        new_relation = Document.where("title LIKE ?", "%" + Document.sanitize_sql_like(word) + "%")
        if index == 0
          scope = scope.and(new_relation)
        else
          scope = scope.or(new_relation)
        end
      end
    end
    scope
  end
end
