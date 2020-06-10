class Order < ApplicationRecord
  validates :date, presence: true
  validates :details, presence: true
end
