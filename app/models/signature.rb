class Signature < ActiveRecord::Base
  belongs_to :user
  has_many :jumps

  validates :user, :presence => true
end