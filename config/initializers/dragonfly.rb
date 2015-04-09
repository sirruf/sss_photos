require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "0ad3de71074d9d580bea8f6d2571f99aab6434b0c4987b276783503549615655"

  url_format "/media/:job/:name"
  url_format "/media/:job/:sha/:name"

  datastore :file,
    root_path: Rails.root.join('uploads/images', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
