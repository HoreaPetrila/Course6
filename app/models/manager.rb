class Manager < ApplicationRecord
  validates_presence_of :name
  belongs_to :team, :optional => true
end
