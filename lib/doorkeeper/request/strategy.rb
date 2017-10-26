module Doorkeeper
  module Request
    class Strategy
      attr_accessor :server, :rails_request

      delegate :authorize, to: :request

      def initialize(server, rails_request = nil)
        self.server = server
        self.rails_request = rails_request
      end

      def request
        raise NotImplementedError, "request strategies must define #request"
      end
    end
  end
end
