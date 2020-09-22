FactoryBot.define do
  factory :item do
    name { "武藤双六" }
    description { "デュエルキング武藤遊戯のおじいちゃん" }
    category_id { 1 }
    status_id { 1 }
    delivery_days_id { 1 }
    prefecture_id { 1 }
    shipping_payer_id { 1 }
    price { 1000 }
    association :user
  end
end