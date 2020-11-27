class Item < ApplicationRecord
with_options presence: true do
  validates :image
  validates :name
  validates :text
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
with_options presence: true, numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :burden_id
  validates :prefecture_id
  validates :days_id
end

belongs_to :user
has_one_attached :image
has_one :order

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :status
belongs_to :burden
belongs_to :prefecture
belongs_to :days
end