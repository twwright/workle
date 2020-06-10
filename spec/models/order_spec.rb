require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'creating an order' do
    before do
      @order = Order.create(date: Date.today, details: "Things we need to do")
    end

    it 'can be created' do
      expect(@order).to be_valid
    end

    it 'can not be created without date or details' do
      @order.date = nil
      @order.details = nil
      expect(@order).to_not be_valid
    end
  end
end