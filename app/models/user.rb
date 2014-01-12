class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :program
  belongs_to :section
  validates :email, uniqueness: true

  def full_name
    return "#{first_name} #{last_name}".titleize
  end
end
