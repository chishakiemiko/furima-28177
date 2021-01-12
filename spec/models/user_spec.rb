require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できない時' do 
     it "passwordが6文字以下では登録できない" do
       @user.password = "aaaaa"
       @user.password_confirmation = "aaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "first_nameが全角でなければ登録できない" do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
      end
      it "family_nameが全角でなければ登録できない" do
        @user.family_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
      end
      it "first_name_kanaが全角でなければ登録できない" do
        @user.first_name_kana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
       end
       it "first_name_kanaがカタカナでなければ登録できない" do
        @user.first_name_kana ="あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
       end
       it "family_name_kanaが全角でなければ登録できない" do
        @user.family_name_kana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
       end
       it "family_name_kanaがカタカナでなければ登録できない" do
        @user.family_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
       end
       it "nicknameが空では登録できない" do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
       end
       it "emailが空では登録できない" do
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
       end
       it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
       end
       it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
       it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Family name is invalid", "First name is invalid", "Family name kana is invalid", "First name kana is invalid")
     end
   end
 end
end
