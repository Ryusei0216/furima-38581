class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only:[:index, :create]

  def index
    @record_address = RecordAddress.new
    
    if (current_user == @item.user) || @item.purchase_record.present?
      redirect_to root_path
    end

  end

  def create
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def record_address_params
    params.require(:record_address).permit(:postal_code,:prefecture_id, :municipalities, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,                    # 商品の値段
        card: record_address_params[:token],    # カードトークン
        currency: 'jpy'                         # 通貨の種類（日本円）
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end