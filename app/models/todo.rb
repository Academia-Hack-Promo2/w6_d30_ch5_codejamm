class Todo < ActiveRecord::Base
  validates :text, presence: true ,length: { minimum: 2 }
  validates :done, presence: true
  validates :done, inclusion: { in: [true, false] }
  validates :done, exclusion: { in: [nil] }
end
