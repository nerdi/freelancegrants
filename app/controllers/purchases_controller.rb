class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json

  def create


    @amount = 1000

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => "Add Profile Title Here",
      :currency => 'aud'
    )
    stripe_token = params[:stripeToken]
    stripe_email = params[:stripeEmail]
    @purchase = Purchase.new(user_id:current_user.id, profile_id: 3, purchase_status_id:2)
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to profiles_path, notice: 'Thanks for buying the Profile' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
    
    
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to profiles_path
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    @amount = 1000

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => "Add Profile Title Here",
      :currency => 'aud'
    )
    stripe_token = params[:stripeToken]
    stripe_email = params[:stripeEmail]

    @purchase = Purchase.find(current_purchase.id)
    @purchase.update!(user_id:current_user.id, purchase_status_id:2)
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to profiles_path, notice: 'Profile was successfully purchased.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
    
    
    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to profiles_path
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.fetch(:purchase, {})
    end
end
