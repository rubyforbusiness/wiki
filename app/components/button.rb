module Components
  class Button < Components::Base
    include Styles::ButtonsAndLinks
    private attr_reader :text, :object, :url, :method
    def initialize(text:, object: nil, url: nil, method:)
      super()
      @text = text
      @object = object
      @url = url
      @method = method
      raise "Either object or url must be specified" unless object || url
    end

    def view_template
      button_to(text, object || url, method: method, class: css_classes)
    end

    private

    def css_classes
      super(%w[mt-2])
    end
  end
end
