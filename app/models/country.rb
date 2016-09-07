class Country < ActiveRecord::Base
  has_one :league

  def to_param
    slug
  end

  def as_json(options = {})
    options[:only] ||= %i(name slug)
    super
  end
end
