FactoryBot.define do
  factory :order do
    date { Date.today }
    details { "Stuff about the order" }
    user
  end

  factory :another_order, class: "Order" do
    date { Date.yesterday }
    details { "Stuff about the yesterday's order" }
    user
  end
end