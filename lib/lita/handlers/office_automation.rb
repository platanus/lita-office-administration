module Lita
  module Handlers
    class OfficeAutomation < Handler
      def self.help_msg(route)
        { "lightning-office-automation:
           #{t("help.#{route}.usage")}" => t("help.#{route}.description") }
      end

      def hassio_service
        Services::HassioAdapter.new
      end

      # Routes.
      route(/^(abre|abreme|alohomora|abretesesamo)$/i,
        command: true, help: help_msg(:open_main_door)) do |response|
        hassio_service.open_main_door
        response.reply(t(:open_main_door))
      end

      Lita.register_handler(self)
    end
  end
end
