Rails.application.routes.draw do

  post 'twilio/send_text' => 'twilio#send_text'

end
