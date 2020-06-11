require 'rails_helper'

# Integration tests for navigation with Capybara

describe 'navigate' do
  describe 'index' do
    it 'can load succesfully' do
      visit orders_path
      expect(page.status_code).to eq(200) # Check for success status code
    end

    it 'has a title of Orders' do
      visit orders_path
      expect(page).to have_content(/Orders/) # Use RegEx to search for match of text
    end
  end

  # Order creation
  describe 'creation of an order' do
    it 'has a form that can load successfully' do
      visit new_order_path
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      visit new_order_path
      fill_in 'order[date]', with: Date.today
      fill_in 'order[details]', with: 'Details for order'
      click_on 'Save'
      expect(page).to have_content('Details for order')
    end
  end

end