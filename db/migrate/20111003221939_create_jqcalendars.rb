class CreateJqcalendars < ActiveRecord::Migration
  def change
    create_table :jqcalendars do |t|
			t.string		:Subject,				:limit => 1000
			t.string		:Location,			:limit => 200
			t.string		:Description
			t.datetime	:StartTime
			t.datetime	:EndTime
			t.integer		:IsAllDayEvent, :limit => 6
			t.string		:Color,					:limit => 200
			t.string		:RecurringRule,	:limit => 500
    end
  end
end
