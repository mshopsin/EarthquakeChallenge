class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.string :Src
      t.string :Eqid
      t.string :Version
      t.datetime :Datetime
      t.float :Lat
      t.float :Lon
      t.float :Magnitude
      t.float :Depth
      t.integer :NST
      t.string :Region

      t.timestamps
    end
    
    add_index :earthquakes, :Datetime
    add_index :earthquakes, :Lat
    add_index :earthquakes, :Lon
    add_index :earthquakes, :Magnitude
    add_index :earthquakes, :Eqid, :unique => true
  end
end
