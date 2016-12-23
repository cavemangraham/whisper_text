Rails.application.routes.draw do

  root 'whispers#new'

  post 'whispers/send_text' => 'whispers#send_text'

  post 'whispers' => 'whispers#send_text'

  get 'whispers/privacy', :as => 'privacy_page'

  get '/.well-known/acme-challenge/8uXs6dJj7vbQZRqT8kwf6gpslBmvlbDTO14X7y9tIlA' => 'whispers#letsencrypt'

end
