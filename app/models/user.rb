class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :recoverable, :registerable,
  devise :database_authenticatable, :rememberable,
         :trackable, :validatable, :lockable
end
