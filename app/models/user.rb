class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :confirmable,
		:recoverable, :rememberable, :validatable

	has_one_attached :image
	has_many :pin, dependent: :destroy
	has_many :likes, dependent: :destroy


	validates :email, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
end
