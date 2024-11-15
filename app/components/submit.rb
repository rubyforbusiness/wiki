module Components
  class Submit < Components::Base
    include Styles::ButtonsAndLinks
    private attr_reader :text, :object, :url
    def initialize(text:)
      super()
      @text = text
    end

    def view_template
      submit_tag(text, class: css_classes)
    end

    private

    def css_classes
      super(%w[ml-2 inline-block])
    end
  end
end