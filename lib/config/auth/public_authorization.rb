# frozen_string_literal: true

module Config
  module Auth
    module PublicAuthorization
      def authorize
        @auth.authorized?(request)
      end
    end
  end
end
