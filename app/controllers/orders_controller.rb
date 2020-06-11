class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :destroy]

  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Your order was saved successfully.'
    else
      render :new 
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:date, :details)
  end
  
  def set_order
    @order = Order.find(params[:id])
  end
end
