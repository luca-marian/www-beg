Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid_connect, {
    name: :keycloak,
    scope: [:openid, :email, :profile],
    response_type: :code,
    discovery: true,
    uid_field: "preferred_username",
    issuer: Cms::Application.config.x.site_config.oidc_issuer,
    client_options: {
      identifier: Cms::Application.config.x.site_config.oidc_client_id,
      secret: Cms::Application.config.x.site_config.oidc_client_secret,
      redirect_uri: Cms::Application.config.x.site_config.return_url,
    },
  }
end