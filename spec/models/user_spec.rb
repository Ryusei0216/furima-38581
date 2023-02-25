require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context 'ユーザー登録ができる時' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,
          first_name_kana,last_name_kana,date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに@がないと登録できない" do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passowrdが全角では登録できない" do  
        @user.password = 'サンプルパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passowrdが半角英字のみでは登録できない" do  
        @user.password = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passowrdが半角数字のみでは登録できない" do  
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passowrdとpassowrd_confirmationが一致してないと登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "last_nameは全角入力（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = 'ryusei'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "first_nameは全角入力（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = 'ryusei'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "last_name_kanaは全角入力(カタカナ)でないと登録できない" do
        @user.last_name_kana = 'sample_name'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "first_name_kanaは全角入力(カタカナ)でないと登録できない" do
        @user.first_name_kana = 'sample_name'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "date_of_birthが空では登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
