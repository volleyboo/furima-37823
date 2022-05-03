class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
    if current_user.id != @content.user_id
      redirect_to root_path
    else
      render :edit
    end

  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to content_path
    else
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(:image,:title,:explanation,:category_id,:state_id,:charge_id,:area_id,:days_id,:price).merge(user_id: current_user.id)
  end

end
