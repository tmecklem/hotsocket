class Product < ApplicationRecord
  validates :inventory, comparison: { greater_than_or_equal_to: 0 }
end
