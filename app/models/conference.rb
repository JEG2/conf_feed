class Conference < ActiveRecord::Base
  has_many :talks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
