module Doorkeeper
  module OAuth
    class AuthorizationCodeRequest < BaseRequest
      validate :attributes,   error: :invalid_request
      validate :client,       error: :invalid_client
      validate :grant,        error: :invalid_grant
      validate :redirect_uri, error: :invalid_grant

      attr_accessor :server, :grant, :client, :redirect_uri, :access_token, :rails_request

      def initialize(server, grant, client, parameters = {}, rails_request = nil)
        @server = server
        @client = client
        @grant  = grant
        @redirect_uri = parameters[:redirect_uri]
        @rails_request = rails_request
      end

      private

      def before_successful_response
        grant.transaction do
          grant.lock!
          raise Errors::InvalidGrantReuse if grant.revoked?

          grant.revoke
          find_or_create_access_token(grant.application,
                                      grant.resource_owner_id,
                                      grant.scopes,
                                      server,
                                      rails_request)
        end
      end

      def validate_attributes
        redirect_uri.present?
      end

      def validate_client
        !!client
      end

      def validate_grant
        return false unless grant && grant.application_id == client.id
        grant.accessible?
      end

      def validate_redirect_uri
        grant.redirect_uri == redirect_uri
      end
    end
  end
end
