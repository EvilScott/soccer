class Season < ActiveRecord::Base
  has_many :matches

  def to_param
    slug
  end
end
