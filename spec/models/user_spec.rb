require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '各項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠が含まれない場合は登録できないこと' do
        @user.email = 'testatexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できないこと' do
        str = 'a1234'
        @user.password = str
        @user.password_confirmation = str
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できないこと' do
        str = '123456'
        @user.password = str
        @user.password_confirmation = str
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字のみでは登録できないこと' do
        str = 'abcdef'
        @user.password = str
        @user.password_confirmation = str
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        str = 'a12345'
        @user.password = str
        @user.password_confirmation = str + 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameに半角カナが含まれる場合は登録できないこと' do
        @user.family_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに半角カナが含まれる場合は登録できないこと' do
        @user.last_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'family_kanaが空では登録できないこと' do
        @user.family_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it 'family_kanaに半角カナが含まれる場合は登録できないこと' do
        @user.family_kana = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end

      it 'last_kanaが空では登録できないこと' do
        @user.last_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'last_kanaに半角カナが含まれる場合は登録できないこと' do
        @user.last_kana = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end