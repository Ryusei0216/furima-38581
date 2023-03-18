class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def record_address_params
    params.require(:record_address).permit(:postal_code,:prefecture_id, :municipalities, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end