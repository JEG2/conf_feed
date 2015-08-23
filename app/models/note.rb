class Note < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user

  validates :body, presence: true
end
