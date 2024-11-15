module Views
  module Documents
    class Index < Views::Base
      private attr_reader :documents, :query

      def initialize(documents:, query:)
        super()
        @documents = documents
        @query = query
      end

      def view_template
        div(class: "w-full") do
          if notice.present?
            p(
              class:
                "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block",
              id: "notice"
            ) { notice }
          end
          content_for :title, "Documents"
          div(class: "flex justify-between items-center") do
            h1(class: "font-bold text-4xl") { "Documents" }
            render Components::Link.new(text: "New",
                                        url: new_document_path,
                                        background_color: "blue",
                                        text_color: "white")
          end
          div(id: "documents", class: "min-w-full") do
            table do
              thead do
                tr do
                  th { "Title" }
                  th { "Actions" }
                end
                form_with model: query, scope: :query, method: :get do |form|
                  div do
                    form.label :title_contains, "Title contains"
                    form.search_field :title_contains
                    render Components::Submit.new(text: "Search")
                    render Components::Link.new(text: "Reset",
                                                url: documents_path)
                  end
                end
              end
              tbody do
                documents.each do |document|
                  tr do
                    td(class: "pt-1") { document.title }
                    td do
                      render Components::Link.new(text: "Show", object: document)
                      render Components::Link.new(text: "Edit",
                                                  url: edit_document_path(document))
                      div(class: "inline-block ml-2") do
                        render Components::Button.new(text: "Destroy",
                                                      object: document,
                                                      method: :delete)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end