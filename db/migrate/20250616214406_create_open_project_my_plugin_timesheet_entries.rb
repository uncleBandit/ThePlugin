# frozen_string_literal: true

class CreateOpenProjectMyPluginTimesheetEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :open_project_my_plugin_timesheet_entries do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :work_package, foreign_key: true
      t.decimal :duration_hours
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
