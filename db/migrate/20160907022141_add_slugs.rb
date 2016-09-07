class AddSlugs < ActiveRecord::Migration[5.0]
  def change
    tables = %i(leagues countries seasons)
    tables.each { |table| add_column table, :slug, :string }
    tables.map { |t| t.to_s.classify.constantize.all }.flatten.each { |x| x.update(slug: x.name.parameterize) }
    tables.each { |table| add_index table, :slug }
    add_index :teams, :short_name
  end
end
