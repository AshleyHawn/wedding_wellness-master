class DailyNote < ActiveRecord::Base
  has_many :comment
  belongs_to :coach
  belongs_to :bride
end
