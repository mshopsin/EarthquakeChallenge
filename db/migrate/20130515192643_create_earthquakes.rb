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
    add_index :Eqid, unique: true
    add_index :Datetime
    add_index :Lat
    add_index :Lon
    add_index :Magnitude
  end
end
