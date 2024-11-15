module Styles
  module TextColorHandler
    def handle_text_color(existing_classes, color)
      supported_colors = %w[white]
      # Because Tailwind asset compiler doesn't handle dynamically created classes
      # we must hardcode them (until we write a better compiler!) in code comments:
      # text-white
      unless supported_colors.include?(color)
        raise "unsupported color: #{color}. Try: #{supported_colors}"
      end
      new_css_class = "text-#{color}"
      existing_classes.delete_if { |c| c.match /text-\w{3,}/ }
      existing_classes << new_css_class
    end
  end
end