require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '購入' do
    context '正常系' do
      it '各項目が正しい形式で入力されていれば正常に処理されること' do
        expect(@order_form).to be_valid
      end
      it 'building の値が nil でも正常に処理されること' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context '異常系' do
      it 'user_id の値が nil だと blank エラーが発生すること' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:user_id, :blank)).to be_truthy
      end
      it 'item_id の値が nil だと blank エラーが発生すること' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:item_id, :blank)).to be_truthy
      end
      it 'token の値が nil だと blank エラーが発生すること' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:token, :blank)).to be_truthy
      end
      it 'post の値が nil だと blank エラーが発生すること' do
        @order_form.post = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:post, :blank)).to be_truthy
      end
      it 'prefecture_id の値が nil だと blank エラーが発生すること' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:prefecture_id, :blank)).to be_truthy
      end
      it 'town の値が nil だと blank エラーが発生すること' do
        @order_form.town = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:town, :blank)).to be_truthy
      end
      it 'address の値が nil だと blank エラーが発生すること' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:address, :blank)).to be_truthy
      end
      it 'tel の値が nil だと blank エラーが発生すること' do
        @order_form.tel = nil
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:tel, :blank)).to be_truthy
      end

      it 'prefecture_id の値が 1 だと other_than エラーが発生すること' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:prefecture_id, :other_than)).to be_truthy
      end
      it 'post の値に "-" が含まれないと invalid エラーが発生すること' do
        @order_form.post = '1234567'
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:post, :invalid)).to be_truthy
      end
      it 'tel の値に "-" が含まれると invalid エラーが発生すること' do
        @order_form.tel = '090-123-456'
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:tel, :invalid)).to be_truthy
      end
      it 'tel の値が 12桁以上 だと invalid エラーが発生すること' do
        @order_form.tel = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:tel, :invalid)).to be_truthy
      end
      it 'tel の値が 9桁以下 だと invalid エラーが発生すること' do
        @order_form.tel = '090123456'
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:tel, :invalid)).to be_truthy
      end
      it 'tel の値が 先頭が0以外 だと invalid エラーが発生すること' do
        @order_form.tel = '1234567890'
        @order_form.valid?
        expect(@order_form.errors.of_kind?(:tel, :invalid)).to be_truthy
      end
    end
  end
end