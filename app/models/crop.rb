class Crop < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
  