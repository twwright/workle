require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit orders_path
    end

  	it 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'has a title of orders' do
  		expect(page).to have_content(/Orders/)
  	end

    it 'has a list of orders' do
      orderone = Order.create(date: Date.today, details: "Order 1", user_id: User.last.id)
      ordertwo = Order.create(date: Date.today, details: "Order 2", user_id: User.last.id)
      visit orders_path
      expect(page).to have_content(/Order 1/)
    end
  end

  describe 'creation' do
  	before do
  		visit new_order_path
  	end

  	it 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'can be created from new form page' do
      fill_in 'order[date]', with: Date.today
      fill_in 'order[details]', with: "Some details"
      click_on "Save"

      expect(page).to have_content("Some details")
  	end

    it 'will have a user associated it' do
      fill_in 'order[date]', with: Date.today
      fill_in 'order[details]', with: "User Association"
      click_on "Save"

      expect(User.last.orders.last.details).to eq("User Association")
    end
  end
end