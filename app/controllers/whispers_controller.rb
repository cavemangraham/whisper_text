class WhispersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_text

    recipient = params[:recipient]
    carrier = params[:carrier]
    message = "Someone Whispe.rs:\n\n" + '"' + params[:message] + '"'

    # Create the client
    easy = SMSEasy::Client.new

    begin
    # Deliver a simple message.
    easy.deliver(recipient, carrier, message)

    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      redirect_to root_path, :flash => { alert: "An error occured. Please try again later."}
    end

    redirect_to root_path, :flash => { notice: "Success! Message Sent!"}

    #redirect_to root_path, :flash => { alert: "Card Error. Please try again."}

  end

  def reply
    from_number = params["From"]

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token

    message_reply = client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "www.whispe.rs"
    )
  end

end
