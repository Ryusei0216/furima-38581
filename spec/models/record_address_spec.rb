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
        binding.pry
        expect(@record_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'municipalitiesが空だと保存できないこと' do
      end
      it 'house_numberが空だと保存できないこと' do
      end
      it 'phone_numberが空では保存できないこと' do
      end
      it 'phone_numberが9桁以下では保存できないこと' do
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
      end
      it 'phone_numberが半角数値でないと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
      it 'itemが紐付いていないと保存できないこと' do
      end
    end
  end
end
