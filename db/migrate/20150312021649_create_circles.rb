class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.float    'lat',  null: false
      t.float    'long', null: false
      t.string   'radius', null: :false
      t.references :map
      t.timestamps
    end
  end
end
