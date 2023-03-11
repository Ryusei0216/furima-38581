class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :definition_item, only:[:show,:edit,:update]

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

  end

  def edit
    #ログアウト状態の場合、ログイン画面へ遷移
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

  def definition_item
    @item = Item.find(params[:id])
  end

end
