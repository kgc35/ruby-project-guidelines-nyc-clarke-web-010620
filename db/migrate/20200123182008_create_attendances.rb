class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :event_id
      t.date :date_of_joining_event
    end
  end
end

