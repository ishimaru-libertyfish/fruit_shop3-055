class Order < ApplicationRecord
  belongs_to :user
  belongs_to :user
  has_many :order_details
  has_many :products, through: :order_details

  validates :count, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true

end
