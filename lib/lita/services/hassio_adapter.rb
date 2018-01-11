module Lita
  module Services
    class HassioAdapter
      include HTTParty

      def initialize
        self.class.base_uri ENV['HASSIO_SERVER_URL']
      end

      def open_main_door
        self.class.post('/services/switch/turn_on',
                        :body => {
                            :entity_id => "switch.main_door"
                        }.to_json,
                        :headers => headers)
      end

      private
      def headers
        {"Authorization" => "Token token=\"#{ENV['HASSIO_SERVER_TOKEN']}\"", 'Content-Type' => 'application/json' }
      end

    end
  end
end