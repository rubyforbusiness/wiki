module Views
end

module Components
end

module Styles
end

Rails.autoloaders.main.push_dir(
  "#{Rails.root}/app/views", namespace: Views
)

Rails.autoloaders.main.push_dir(
  "#{Rails.root}/app/components", namespace: Components
)

Rails.autoloaders.main.push_dir(
  "#{Rails.root}/app/styles", namespace: Styles
)
