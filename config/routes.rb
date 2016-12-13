Rails.application.routes.draw do

  root 'whisper#landing'

  post 'whisper/send_text' => 'whisper#send_text'

end
