class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.belongs_to :attended_event, class_name: 'Event', foreign_key: { to_table: :events}
      t.belongs_to :attendee, class_name: 'User', foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
