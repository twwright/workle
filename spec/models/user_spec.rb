require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
    
  describe 'creating a user' do

    it 'can be created' do
      expect(@user).to be_valid
    end
    
    it 'can not be created without first_name, last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full-name method' do
      expect(@user.full_name). to eq("Jon Snow")
    end
  end

end
