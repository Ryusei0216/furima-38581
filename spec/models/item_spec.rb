require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/sample.jpg')
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "全ての項目が入力されていれば、商品は保存される" do
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "imageがないと商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "item_nameがないと商品は保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "descriptionがないと商品は保存できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end      
      it "userが紐付いていないと商品は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it "priceがないと商品は保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceに全角を入力すると商品は保存できない" do
        @item.price = '全角数字９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not Half-width number"
      end
      it "priceに半角英字を入力すると商品は保存できない" do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not Half-width number"
      end
      it "priceが300より小さいと商品は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is Out of setting range"
      end
      it "priceが10,000,000以上の値では保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is Out of setting range"
      end
      it "category_idが未選択だと商品は保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "category_idで1(---)を選択すると商品は保存できない" do
        @item.category_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end        
      it "status_idが未選択だと商品は保存できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "status_idで1(---)を選択すると商品は保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "charge_idが未選択だと商品は保存できない" do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it "charge_idで1(---)を選択すると商品は保存できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it "prefecture_idが未選択だと商品は保存できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "prefecture_idで1(---)を選択すると商品は保存できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end            
      it "day_idが未選択だと商品は保存できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it "day_idで1(---)を選択すると商品は保存できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
    end
  end
end
