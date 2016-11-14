class PaymentsController < ApplicationController
before_action :authenticate_user!

def index
  @payments = current_user.payments.all
end

def new
  @payment = Payment.new
end


def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'MerchEgg 30 Day Sub',
    :currency    => 'aud'
  )

  @payment = current_user.payments.new(description: charge[:description], amount: charge[:amount], stripe_payment_id: charge[:id])
  @payment.save
  current_user.profile.subscribe

  
  # later, put logic in to set a 'subscribed to' value for user
  #also, need to update users plan type to 'pro'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  private

end