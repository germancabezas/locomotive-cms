require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick,
    convert_command:  `which convert`.strip.presence || '/usr/local/bin/convert',
    identify_command: `which identify`.strip.presence || '/usr/local/bin/identify'

  verify_urls true

  secret '9686f51bab28cc58a5243b7a784a6c5f6c61c508c6832093ffe880899432e8aa'

  url_format '/images/dynamic/:job/:basename.:ext'

  fetch_file_whitelist /public/

  fetch_url_whitelist /.+/
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware