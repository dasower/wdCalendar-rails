class CreateApptCalendars < ActiveRecord::Migration
  def change
    create_table :appt_calendars do |t|

      t.timestamps
    end
  end
end
