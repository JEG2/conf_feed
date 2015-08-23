class Talk < ActiveRecord::Base
  belongs_to :conference
  has_many   :notes, dependent: :destroy

  validates :conference_id, presence: true
  validates :title,         presence: true, uniqueness: {scope: :conference_id}
  validates :speaker,       presence: true
  validates :presented_at,  presence: true
end
