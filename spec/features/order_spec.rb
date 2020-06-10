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
end