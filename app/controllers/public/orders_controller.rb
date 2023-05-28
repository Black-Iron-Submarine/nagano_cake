class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @freight = 800
    @sum = 0
  end

  def complete
  end

  def show
  end

  def index
  end
end
