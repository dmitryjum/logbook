class User < ActiveRecord::Base
  has_many :jumps
  has_many :jump_users
  has_many :shared_jumps, through: :jump_users, source: :jump
  has_many :picture_comments, { :dependent => :destroy }
  has_attached_file :avatar,
                    :styles => { :medium => "300x189>", :thumb => "100x63>" },
                    :default_url => "/assets/freefallman.jpg",
                    :storage => :s3,
                    :bucket => 'skydivepagesavatar',
                    :s3_credentials => {
                    :access_key_id => ENV['IMAGO_AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['IMAGO_AWS_SECRET_ACCESS_KEY']
                    }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 6.megabytes


  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true

  has_secure_password
end