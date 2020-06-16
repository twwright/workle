require 'rails_helper'
require 'pry'

# Integration tests for navigation with Capybara

describe 'navigate' do
  before do
    user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Elon", last_name: "Musk")
    login_as(user, :scope => user) # Mimics user session using Warden test helpers
  end

  describe 'index' do
    before do
      visit orders_path
    end

    it 'can render successfully' do
      expect(page.status_code).to eq(200) # Check for success status code
    end

    it 'has a title' do

      expect(page).to have_content(/Orders/) # Use RegEx to search for match of text
    end

    it 'has a list of orders' do
      order1 = Order.create(date: Date.today, details: "Things we need to do 1")
      order2 = Order.create(date: Date.today, details: "Things we need to do 2")
      visit orders_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end 

  # Order creation
  describe 'creation of an order' do
    before do
      visit new_order_path
    end

    it 'has a form that can renders successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      binding.pry
      fill_in 'order[date]', with: Time.new.strftime("%m-%e-%y")
      fill_in 'order_details', with: 'Details for order'
      click_on 'Save'
      expect(page).to have_content('Details for order')
    end

    it 'will have a user associated with it' do
      fill_in 'order_date', with: Time.new.strftime("%m-%e-%y")
      fill_in 'order_details', with: 'User association test' 
      click_on 'Save'
      expect(User.last.orders.last.details).to eq('User association test')
    end
  end

end