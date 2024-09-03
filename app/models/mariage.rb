class Mariage < ApplicationRecord
  has_many :guests, dependent: :destroy

  accepts_nested_attributes_for :guests, update_only: true
end
