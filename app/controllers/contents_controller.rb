class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_content, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    if current_user.id != @content.user_id
      redirect_to root_path
    else
      render :edit
    end

  end

  def update
    if @content.update(content_params)
      redirect_to content_path
    else
      render :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to root_path
  end

  private

  def content_params
    params.require(:content).permit(:image,:title,:explanation,:category_id,:state_id,:charge_id,:area_id,:days_id,:price).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
  end

end
