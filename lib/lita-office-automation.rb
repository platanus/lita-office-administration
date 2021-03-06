require "lita"
require "httparty"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/office_automation"
require "lita/services/hassio_adapter"

Lita::Handlers::OfficeAutomation.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
