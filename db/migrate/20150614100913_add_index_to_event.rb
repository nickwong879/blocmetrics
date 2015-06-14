class AddIndexToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :application, index: true
    add_foreign_key :events, :applications
  end
end
