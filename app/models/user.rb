class User < ActiveRecord::Base
  has_many :jumps
  has_many :jump_users
  has_many :shared_jumps, through: :jump_users, source: :jump

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true

  has_secure_password

  extend SimpleCalendar
  has_calendar attribute: :start_time

  def start_time
    date
  end
end