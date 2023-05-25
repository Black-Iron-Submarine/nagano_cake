class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @item = 
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price_without_tax, :genre_id, :sales_status)
  end
end
