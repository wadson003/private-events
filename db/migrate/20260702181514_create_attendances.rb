class CreateAttendances < ActiveRecord::Migration[8.1]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id
      t.integer :attented_event_id

      t.timestamps
    end
  end
end
