class PurchasesController < ApplicationController
  before_action :set_content, only: [:index, :create]


  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      @content = Content.find(params[:content_id])
      render :index
    end 
  end
  

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :area_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, content_id: params[:content_id])
  end
  

  def set_content
    @content = Content.find(params[:content_id])
  end

end
