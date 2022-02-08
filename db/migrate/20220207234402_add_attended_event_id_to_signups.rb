class AddAttendedEventIdToSignups < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :signups, :events, column: :attended_event_id 
  end
end
