Rails.application.routes.draw do

  root 'whispers#new'

  post 'whispers/send_text' => 'whispers#send_text'

  post 'whispers' => 'whispers#send_text'

  get 'whispers/privacy', :as => 'privacy_page'

end
