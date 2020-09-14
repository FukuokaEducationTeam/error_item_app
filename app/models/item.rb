class Item < ApplicationRecord

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :delivery_days

  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 0, message: "---以外を選んでください" } do
    validates :status_id
    validates :shipping_payer_id
    validates :delivery_days_id
    validates :prefecture_id
  end

  validates :price, numericality: { less_than: 9999999, greater_than: 299, message: "300 ~ 9999999の間で価格を入力してください" }

end
