class Element < ApplicationRecord
  has_many :element_properties, inverse_of: :element
  has_many :page_elements, dependent: :nullify

  accepts_nested_attributes_for :element_properties, allow_destroy: true, reject_if: :all_blank

end
