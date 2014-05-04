class Message < ActiveRecord::Base

  scope :to,           -> (to)    { where(:to => to) }
  scope :created_after -> (after) { where("created_at >= '#{after}'") }

end