class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :URL
      # t.references :user, index: true

      t.timestamps null: false
    end
  end
end
