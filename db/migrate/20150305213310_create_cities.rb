class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string  'name',       null: false
      t.string  'state',      null: false
      t.integer 'population', null: false
      t.string  'website',    null: false
      t.timestamps
    end
  end
end
