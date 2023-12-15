class Order < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  belongs_to :product
  validates :amount, :user, presence: :true
end
