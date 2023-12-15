class Product < ActiveRecord::Base
  has_many :orders
  belongs_to :category

  validates :name, :category_id, presence: true
end
