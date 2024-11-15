module Components
  class Link < Components::Base
    include Styles::ButtonsAndLinks
    include Styles::BackgroundColorHandler
    include Styles::TextColorHandler

    private attr_reader :text, :object, :url,
                        :background_color,
                        :text_color

    def initialize(text:, object: nil, url: nil,
                   background_color: nil,
                   text_color: nil)
      super()
      @text = text
      @object = object
      @url = url
      @background_color = background_color
      @text_color = text_color

      raise "Either object or url must be specified" unless object || url
    end

    def view_template
      link_to(text,
              object || url,
              class: css_classes)
    end

    private

    def css_classes
      styles = super(%w[ml-2 inline-block])
      handle_background_color(styles, background_color) if background_color
      handle_text_color(styles, text_color) if text_color
      styles
    end
  end
end
