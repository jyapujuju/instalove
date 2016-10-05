class Post < ActiveRecord::Base
  validates :description, :user_id, presence: true
  has_many :comments, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  belongs_to :user
end
