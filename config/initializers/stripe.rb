Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_sSY0kO2WHAbMMkP3zssgmPUB'],
  :secret_key      => ENV['sk_test_dWUzVY1kMVTol9gMH9jjg4GC']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
