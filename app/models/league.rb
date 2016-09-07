class League < ActiveRecord::Base
  belongs_to :country
  has_many :matches
  has_many :teams

  def to_param
    slug
  end
end
