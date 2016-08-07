class League < ActiveRecord::Base
  self.table_name = 'league'
  belongs_to :country
  has_many :matches
end
