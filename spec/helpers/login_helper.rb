def login
  #Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  visit root_path
  click_link 'Admin Login'
end
