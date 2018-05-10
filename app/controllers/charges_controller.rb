class ChargesController < ApplicationController
  before_action :authenticate_user!
  def new; end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    @user = User.find(params[:user])
    if @user.has_role? :charity
      @user.add_role(:premium)
      @user.volunteer_cap = 8
      @user.job_cap = 6
      @user.save
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
