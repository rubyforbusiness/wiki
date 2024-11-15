module Styles
  module ButtonsAndLinks
    # CSS classes common to both Buttons and Links
    # NB: the caller is responsible for resolving clashes between these default classes and any additional ones
    def css_classes(additional_classes = [])
      %w[rounded-lg py-1 px-3 bg-gray-100 font-medium] + additional_classes
    end
  end
end
