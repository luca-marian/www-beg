# frozen_string_literal: true

module Config
  module Auth
    module PublicAuthentication
      def authenticate
        @auth = HeaderAuthenticator.new(request.headers['Authorization'], :public_read)
      end
    end
  end
end
