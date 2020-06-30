FactoryBot.define do
  sequence :email do |i|
    "test#{i}@test.com"
  end

  factory :user do
    first_name { 'Jon' }
    last_name { 'Snow' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
  end

  factory :admin_user, class: "AdminUser" do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
  end
end