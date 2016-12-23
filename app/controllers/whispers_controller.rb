class WhispersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_text

    recipient = params[:recipient]
    carrier = params[:carrier]
    message = "Someone Whispe.rs:\n" + '"' + params[:message] + '"'

    # Create the client
    easy = SMSEasy::Client.new

    begin
    # Deliver a simple message.
    easy.deliver(recipient, carrier, message)

    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      redirect_to root_path, :flash => { alert: "An error occured. Please try again later."}
    end

    @whisper = Whisper.new(:message => params[:message])
    @whisper.save

    puts Whisper.all.count

    redirect_to root_path, :flash => { notice: "Success! Message Sent!"}

    #redirect_to root_path, :flash => { alert: "Card Error. Please try again."}

  end

  def letsencrypt
    render text: "8uXs6dJj7vbQZRqT8kwf6gpslBmvlbDTO14X7y9tIlA.F1Oaigrw6nTcOmPU71aLfy98G0-ILdvFEtsQHFpKLd4"
  end
end
