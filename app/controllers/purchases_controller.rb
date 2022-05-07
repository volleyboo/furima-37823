class PurchasesController < ApplicationController
  before_action :set_content, only: [:index, :create]


  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
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


  
end
