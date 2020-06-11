class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params.require(:order).permit(:date, :details))
    @order.save
    redirect_to @order
  end

  def show
    @order = Order.find(params[:id])
  end
end
