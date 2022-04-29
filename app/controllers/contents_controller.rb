class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @contents = Content.order("created_at DESC")
  end

  def new
    @content = Content.new
  end
  
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def content_params
    params.require(:content).permit(:image,:title,:explanation,:category_id,:state_id,:charge_id,:area_id,:days_id,:price).merge(user_id: current_user.id)
  end

end
