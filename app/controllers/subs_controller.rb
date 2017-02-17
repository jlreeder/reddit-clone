class SubsController < ApplicationController
  def index
    @subs = Sub.all
    render json: @subs
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render json: @sub
  end

  def new
    render :new
  end

  def create
    new_sub = Sub.new(sub_params)
    if new_sub.save
      redirect_to sub_url(new_sub)
    else
      redirect_to new_sub_url
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    found_sub = Sub.find(params[:id])
    if found_sub && found_sub.update(sub_params)
      redirect_to sub_url(found_sub)
    else
      redirect_to edit_sub_url
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

end
