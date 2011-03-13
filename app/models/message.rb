class Message < ActiveRecord::Base
  belongs_to :sender,    :class_name => 'Actor'
  belongs_to :recipient, :class_name => 'Actor'

  validates_presence_of :body, :type
end
