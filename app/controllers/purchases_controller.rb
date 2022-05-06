class PurchasesController < ApplicationController
  before_action :set_content, only: [:index, :create]


  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      redirect_to content_purchases_path
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
