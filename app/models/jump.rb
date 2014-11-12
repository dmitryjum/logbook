class Jump < ActiveRecord::Base
  belongs_to :user
  belongs_to :signature
  has_many :pictures, { :dependent => :destroy }
  has_many :videos, { :dependent => :destroy }
  has_many :jump_users
  
  has_many :shared_users, through: :jump_users, source: :user

  validates :jump_number, :presence => true

  scope :mine, lambda {|param, user| where(date: param).select {|jump| jump.user_id == user}}
  scope :others, lambda {|param, user| where(date: param).select {|jump| jump.shared_users.include?(user) && User.exists?(jump.user_id)}}
  scope :allothers, lambda {|user| select {|jump| jump.shared_users.include?(user) && User.exists?(jump.user_id)}}
end