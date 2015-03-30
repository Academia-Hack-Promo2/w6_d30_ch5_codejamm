class Todo < ActiveRecord::Base
  validates :text, presence: true ,length: { minimum: 2 }, uniqueness: true
  validates :done, inclusion: { in: [true, false] }
  validates :done, exclusion: { in: [nil] }
end
