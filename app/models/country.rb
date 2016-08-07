class Country < ActiveRecord::Base
  self.table_name = 'country'
  has_one :league
end
