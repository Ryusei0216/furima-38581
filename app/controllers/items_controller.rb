class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  #def move_to_index
  #  unless user_signed_in?
  #    redirect_to action: :index
  #  end
  #end

  def item_params
    params.require(:item).permit(:image,:item_name,:description,:price,:category_id,:status_id,:charge_id,:prefecture_id,:day_id).merge(user_id: current_user.id)
  end
end
