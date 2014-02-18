class Jump < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, { :dependent => :destroy }
  has_many :videos, { :dependent => :destroy }
  validates :jump_number, :presence => true
end