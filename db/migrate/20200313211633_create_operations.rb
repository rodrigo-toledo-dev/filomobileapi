class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.string :operation
      t.string :employee

      t.timestamps
    end
  end
end
