class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @record_address = RecordAddress.new
  end

  def new
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_address_params)
  end
  
  private

  def record_address_params
    params.require(:record_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number).merge(user_id: current_user.id)
  end

end
