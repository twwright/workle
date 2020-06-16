class Order < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :details, presence: true
end
