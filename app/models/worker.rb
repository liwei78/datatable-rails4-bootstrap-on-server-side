class Worker < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  acts_as_taggable_on :skills
end
