# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Components

  # Include any helpers you want to be available across all components
  include Phlex::Rails::Helpers::Routes
  # The following are used by the phlex_scaffold generator but can be removed if you don't use that
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::DOMID
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::Pluralize
  include Phlex::Rails::Helpers::ContentFor
  include Phlex::Rails::Helpers::SubmitTag

  register_value_helper :notice

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end
end
