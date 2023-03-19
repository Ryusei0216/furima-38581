require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/image/sample.jpg')
      @item.save
      @record_address = FactoryBot.build(:record_address, user_id: @user.id, item_id: @item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @record_address.building = ""
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = "9999999"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'prefectureを選択していないと保存できないこと' do
        @record_address.prefecture_id = "1"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalitiesが空だと保存できないこと' do
        @record_address.municipalities = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @record_address.house_number = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空では保存できないこと' do
        @record_address.phone_number = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @record_address.phone_number = "123456789"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @record_address.phone_number = "123456789012"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it 'phone_numberが全角数字では保存できないこと' do
        @record_address.phone_number = "１２３４５６７８９０"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Phone number is not a number"
      end
      it 'phone_numberが半角英字では保存できないこと' do
        @record_address.phone_number = "phonenumber"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Phone number is not a number"
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
