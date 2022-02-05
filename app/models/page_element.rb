class PageElement < ApplicationRecord
  belongs_to :page
  belongs_to :element

  serialize :properties

end
