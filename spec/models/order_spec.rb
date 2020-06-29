require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    login_as(user, :scope => :user)
    @order = Order.create(date: Date.today, details: "Things we need to do", user_id: user.id)
  end

  describe 'creating an order' do

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