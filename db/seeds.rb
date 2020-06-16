@user = User.create(email: "seed@seed.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Nikolai", last_name: "Tesla")

puts "seed@seed.com with password 'asdfasdf' set up successfully"

25.times do |order|
  Order.create!(date: Date.today, details: "#{order} detail content", user_id: @user)
end

puts "25 seed orders have been created successfully!"