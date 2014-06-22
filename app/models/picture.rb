class Picture < ActiveRecord::Base
  belongs_to :jump
  has_many :picture_comments
end