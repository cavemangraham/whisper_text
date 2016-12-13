class WhispersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_text

    recipient = params[:recipient]
    message = params[:message]

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token

    message = client.messages.create from: Rails.application.secrets.twilio_number, to: recipient, body: message + "-sent via whisper.com"

    render plain: message.status
  end

end
