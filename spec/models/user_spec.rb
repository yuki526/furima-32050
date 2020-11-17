require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    # ユーザー情報テスト
    it 'すべての項目が正しく存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname can't be blank')
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Email can't be blank')
    end

    it '重複したemailが存在する場合登録できないこと' do
      another_user = FactoryBot.build(:user)
      another_user.save
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailが@を含んでいない場合登録できないこと' do
      @user.email = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Password can't be blank')
    end

    it 'passwordが５文字以下の場合登録できないこと' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英字のみの場合登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが半角数字のみの場合登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '1234abcd'
      @user.password_confirmation = 'abcd1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password confirmation doesn't match Password')
    end


    #本人情報確認テスト
    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('First name can't be blank')
    end

    it 'first_nameが半角文字では登録できないこと' do
      @user.first_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name can't be blank')
    end

    it 'last_nameが半角文字では登録できないこと' do
      @user.last_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_name_readingが空では登録できないこと' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading can't be blank')
    end

    it 'last_name_readingが空では登録できないこと' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading can't be blank')
    end

    it 'first_name_readingが半角カナ以外では登録できないこと' do
      @user.first_name_reading = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading  Full-width katakana characters')
    end

    it 'last_name_readingが半角カナ以外では登録できないこと' do
      @user.last_name_reading = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading  Full-width katakana characters')
    end

    it '生年月日が空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Birth date can't be blank')
    end

  end
end

