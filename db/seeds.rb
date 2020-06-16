@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Elon", last_name: "Musk")

puts "test@test.com with password asdfasdf set up successfully"

15.times do |order|
  Order.create!(date: "2020-06-09", details: "#{details} detail content", user_id: @user)
end

puts "15 seed orders have been created successfully!"