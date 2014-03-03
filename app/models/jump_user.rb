class JumpUser < ActiveRecord::Base
  validates :jump, :user, presence: true
  belongs_to :jump
  belongs_to :user
end