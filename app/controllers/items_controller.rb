class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc).includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image ,:price, :status_id, :delivery_days_id, :prefecture_id, :shipping_payer_id, :description, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
