class WhispersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_text

    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = Rails.application.secrets.stripe_secret

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    recipient = params[:recipient]
    message = params[:message]

    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 100, # Amount in cents
        :currency => "usd",
        :source => token,
        :description => "One Anonymous Text"
      )

      client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token

      message = client.messages.create from: Rails.application.secrets.twilio_number, to: recipient, body: message

      kill_message = client.messages.get(message.sid)

      kill_message.redact

      redirect_to root_path, :flash => { notice: "Success! Message Sent!"}

    rescue Stripe::CardError => e
      redirect_to root_path, :flash => { alert: "Card Error. Please try again."}
    end
  end
end
