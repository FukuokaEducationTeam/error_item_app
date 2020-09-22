require "rails_helper"

RSpec.describe Item, type: :model do

  describe "validation" do
    
    before do
      @item = FactoryBot.build(:item)
    end

    context "All clear" do
      it "is valid with item" do
        expect(@item).to be_valid
      end
    end

    context "presence true" do
      it "is invalid without name" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "is invalid without image" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "is invalid without description" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "is invalid without category_id" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category ---以外を選んでください")
      end

      it "is invalid without status_id" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status ---以外を選んでください")
      end

      it "is invalid without delivery_days_id" do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days ---以外を選んでください")
      end

      it "is invalid without prefecture_id" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture ---以外を選んでください")
      end

      it "is invalid without shipping_payer_id" do
        @item.shipping_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping payer ---以外を選んでください")
      end

      it "is invalid if price is less than 299" do
        @item.price = 299
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300 ~ 9999999の間で価格を入力してください")
      end

      it "is invalid with upppercase letter" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300 ~ 9999999の間で価格を入力してください")
      end
    end
  end
end