class WhisperController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_text
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token

    message = client.messages.create from: Rails.application.secrets.twilio_number, to: '9739752575', body: 'Learning to send SMS you are.'

    render plain: message.status
  end
end
