class Plant < ApplicationRecord
  belongs_to :garden
  has_many :completions
  validates :name, presence: true
end
