class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d{6,}]+\z/i.freeze
  
  with_options presence: true do
    validates :password,    format: { with: VALID_PASSWORD }
    validates :nickname,    length: { maximum: 40 }
    validates :birthday,    presence: { message: "Select" }
    validates :gender,      inclusion: { in: ["male", "female"], message: "Select" }
    validates :height,      numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 300, message: "Enter in centimeters" }
    validates :diet_reason, length: { maximum: 1024 }
  end

  has_many :records
end
