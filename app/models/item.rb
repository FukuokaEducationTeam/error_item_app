class Item < ApplicationRecord

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :delivery_days

  has_one_attached :images


  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 0, message: "---以外を選んでください" } do
    validates :category
    validates :status
    validates :shipping_payer
    validates :delivery_days
    validates :prefecture
  end

  validates :price, numericality: { greater_than: 9999999, less_than: 300, message: "300 ~ 9999999の間で価格を入力してください" }

end
