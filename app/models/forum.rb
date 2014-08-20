class Forum < ActiveRecord::Base
  has_many :replies
  belongs_to :board
end
