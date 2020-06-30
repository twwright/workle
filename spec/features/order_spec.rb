require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as @user, scope: :user
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

    # it 'has a list of orders' do
    #   order1 = FactoryBot.build_stubbed(:order)
    #   order2 = FactoryBot.build_stubbed(:another_order)
    #   visit orders_path
    #   save_and_open_page
    #   expect(page).to have_content(/Stuff/)
    # end
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