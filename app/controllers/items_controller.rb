class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:index]
  def index

  end

  def new
    #@item = Item.new
  end

  #def create
  #  Item.create(item_params)
  #end
  #private
  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :index
    #end
  #end

  def item_params
    params.require(:item).permit(:image,:item_name,:description,:price,:category_id,:status_id,:charge_id,:prefecture_id,:day_id,:user)
  end
end
