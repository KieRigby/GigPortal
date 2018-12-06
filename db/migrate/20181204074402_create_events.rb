class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null:false
      t.string :short_description, null:false
      t.text :long_description, null:false
      t.string :location
      t.boolean :location_tbc, null:false, default:true
      t.datetime :date
      t.boolean :date_tbc, null:false, default:true
      t.boolean :published, null:false, default: false

      t.timestamps
    end
  end
end
