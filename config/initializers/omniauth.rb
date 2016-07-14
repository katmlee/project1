Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_secret, {:scope => ['user_about_me', 'public_profile', 'user_photos', 'publish_actions']}
end
