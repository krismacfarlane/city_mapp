class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.float    'lat',  null: false
      t.float    'long', null: false
      t.string     'popup_content'
      t.references :map
      t.timestamps
    end
  end
end
