class League < ActiveRecord::Base
  belongs_to :country
  has_many :matches
  has_many :teams

  def to_param
    slug
  end

  def as_json(options = {})
    options[:only] ||= %i(name slug)
    options[:include] ||= { country: { only: %i(name slug) }}
    super
  end
end
