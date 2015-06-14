class AddSummaryToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :summary, :string
    add_reference :applications, :user, index: true
    add_foreign_key :applications, :users
  end
end
