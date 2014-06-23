class Picture < ActiveRecord::Base
  belongs_to :jump
  has_many :picture_comments, { :dependent => :destroy }

  has_attached_file :image_file,
                    :storage => :s3,
                    :bucket => 'skydivepages',
                    :s3_credentials => {
                    :access_key_id => ENV['IMAGO_AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['IMAGO_AWS_SECRET_ACCESS_KEY']
                    }
  validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image_file, :less_than => 7.megabytes
  validates :name, presence: true
end