Rails.application.routes.draw do

  root 'whispers#new'

  post 'whispers/send_text' => 'whispers#send_text'

end
