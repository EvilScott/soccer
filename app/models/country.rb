class Country < ActiveRecord::Base
  has_one :league

  default_scope { order(:name) }

  def to_param
    slug
  end

  def as_json(options = {})
    options[:only] ||= %i(name slug)
    super
  end
end
