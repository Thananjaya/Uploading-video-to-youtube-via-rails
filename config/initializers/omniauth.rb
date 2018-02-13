Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '342293775341-9u29j31uuc15jd2aq5nn77ecfkc9fs21.apps.googleusercontent.com', 'aU4wGk2cdN3Cb_4fa_9DNQru', scope: 'userinfo.profile,youtube'
end