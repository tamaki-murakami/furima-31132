class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :token, :post, :prefecture_id, :town, :address, :building, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :town
    validates :address
    validates :tel, format: { with: /\A0\d{9,10}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post: post, prefecture_id: prefecture_id, town: town, address: address, building: building, tel: tel, order_id: order.id)
  end
end