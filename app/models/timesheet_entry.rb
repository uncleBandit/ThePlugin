# frozen_string_literal: true

class OpenProject::MyPlugin::TimesheetEntry < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :work_package
end
