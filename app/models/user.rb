class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # protect_from_forgery prepend: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
