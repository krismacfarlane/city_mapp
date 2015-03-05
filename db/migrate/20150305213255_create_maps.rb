class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string     'title', null: false
      t.references :user
      t.references :city
      t.timestamps
    end
  end
end
