module Styles
  module BackgroundColorHandler
    def handle_background_color(existing_classes, color)
      supported_colors = %w[blue gray]
      # Because Tailwind asset compiler doesn't handle dynamically created classes
      # we must hardcode them (until we write a better compiler!) in code comments:
      # bg-blue-600
      # bg-gray-600
      unless supported_colors.include?(color)
        raise "unsupported color: #{color}. Try: #{supported_colors}"
      end
      new_css_class = "bg-#{color}-600"
      existing_classes.delete_if { |c| c.match /bg-\w{3,}-\d{3}/ }
      existing_classes << new_css_class
    end
  end
end