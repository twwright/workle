@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")

puts "test@test.com with password 'asdfasdf' set up successfully"

25.times do |order|
    Order.create!(date: Date.today, details: "#{order} detail content", user_id: @user.id)
end

puts "25 orders created successfully"