require 'rails_helper'

describe User do
  describe '#create' do

    # RSpecのみの場合
    # it 'nickname空欄の場合登録できない' do
    #   user = User.new(nickname: "", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000")
    #   # expect(user.save).to be_falsey
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("can't be blank", "is too short (minimum is 4 characters)")
    # end

    # factory_botを導入した場合
    # it 'nickname空欄の場合登録できない' do
    #   user = FactoryBot.build(:user, nickname: "")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("can't be blank", "is too short (minimum is 4 characters)")
    # end

    # factory_botを導入し、且つrails_helper.rbに追記した場合
    it 'nickname空欄の場合登録できない' do
      user = build(:user, nickname: "" )
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank", "is too short (minimum is 4 characters)")
    end

    it 'email空欄の場合登録できない' do
      user = build(:user, email: "" )
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # it '' do
    # end

    it 'nickname,email,password,password_confirmationがあれば登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nickname4文字以上の場合、登録できる' do
    end

    it 'nickname3文字以下の場合、登録できない' do
    end

    it 'email重複すると登録できない' do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it 'パスワード空欄の場合登録できない' do
      user = build(:user, password: "" )
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'パスワード6文字以上の場合、登録できる' do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it 'パスワード5文字以下の場合、登録できない' do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it 'パスワード半角英数字の場合登録できる' do
      user = build(:user, password: "0a0a0a", password_confirmation: "0a0a0a")
      expect(user).to be_valid
    end

    it 'パスワード半角英数字以外の場合登録できない' do
      user = build(:user, password: "ああああああ", password_confirmation: "ああああああ")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it 'パスワードに記号は使えない' do
      user = build(:user, password: "!?!?!?", password_confirmation: "!?!?!?")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

  end
end
