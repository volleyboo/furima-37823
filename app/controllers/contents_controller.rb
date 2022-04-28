class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @content = Content.new
  end
  
end
