class Page < ApplicationRecord
  has_many :page_elements, dependent: :destroy
end
