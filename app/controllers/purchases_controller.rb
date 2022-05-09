class PurchasesController < ApplicationController
  before_action :set_content, only: [:index, :create]
  before_action :authenticate_user!
  
  def index
    @purchase = PurchaseForm.new
    if @content.user_id == current_user.id || @content.purchase != nil
      redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      @content = Content.find(params[:content_id])
      render :index
    end 
  end
  

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :area_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, content_id: params[:content_id], token: params[:token])
  end
  

  def set_content
    @content = Content.find(params[:content_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @content.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

    

end
