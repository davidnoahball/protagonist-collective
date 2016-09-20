OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '560315838364-aeffnvnd76jrk4vp1vffs0a77nn9af1n.apps.googleusercontent.com', 'Jh5T-VQtDPo9wewYGpYpJEln', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end