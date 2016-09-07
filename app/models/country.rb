class Country < ActiveRecord::Base
  has_one :league

  def to_param
    slug
  end
end
