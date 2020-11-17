require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "すべての項目が正しく存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      another_user = FactoryBot.build(:user)
      another_user.save
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが@を含んでいない場合登録できないこと" do
      @user.email = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが５文字以下の場合登録できないこと" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英字のみの場合登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordが半角数字のみの場合登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "1234abcd"
      @user.password_confirmation = "abcd1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end




    # it "nicknameが空では登録できないこと" do
    # end
    # it "nicknameが空では登録できないこと" do
    # end



  end

end

# ニックネームが必須であること
# メールアドレスが必須であること
# メールアドレスが一意性であること
# メールアドレスは、@を含む必要があること
# パスワードが必須であること
# パスワードは、6文字以上での入力が必須であること
# パスワードは、半角英数字混合での入力が必須であること
# パスワードは、確認用を含めて2回入力すること
# パスワードとパスワード（確認用）、値の一致が必須であること