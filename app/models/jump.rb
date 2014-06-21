class Jump < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, { :dependent => :destroy }
  has_many :videos, { :dependent => :destroy }
  has_many :jump_users
  
  has_many :shared_users, through: :jump_users, source: :user

  validates :jump_number, :presence => true

  extend SimpleCalendar
  has_calendar attribute: :start_time

  def start_time
    date
  end

  scope :mine, lambda {|param, user| where(date: param).select {|jump| jump.user_id == user}}
  scope :others, lambda {|param, user| where(date: param).select {|jump| jump.user_id != user}}
end