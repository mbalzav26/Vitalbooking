class User < ApplicationRecord
  rolify
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :phones, as: :phoneable

  # def send_devise_notification(notification, *args)
  #  devise_mailer.send(notification, self, *args).deliver_later
  # end
end
