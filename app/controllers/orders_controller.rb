class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all # orders_by(current_user).page(params[:page]).per(10)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
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
