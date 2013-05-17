class CreateFakeModels < ActiveRecord::Migration
  def change
    create_table :fake_models do |t|

      t.timestamps
    end
  end
end
