class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.integer    'lat',  null: false
      t.integer    'long', null: false
      t.string     'popup_content'
      t.references :map
      t.timestamps
    end
  end
end
