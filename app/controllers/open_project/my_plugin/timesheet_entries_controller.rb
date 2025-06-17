# frozen_string_literal: true

module OpenProject::MyPlugin
  class TimesheetEntriesController < ApplicationController
    # Ensure user is authenticated
    before_action :require_login

    # You might need to load the project if routes are nested, or if you're checking project-specific permissions
    # before_action :find_project, only: [:index, :new, :create]

    # Load TimesheetEntry for show, edit, update, destroy
    before_action :find_timesheet_entry, only: [:show, :edit, :update, :destroy]

    def index
      # Example: only show current user's entries, ordered by date
      @timesheet_entries = TimesheetEntry.where(user: current_user).order(date: :desc)
    end

    def show
      # @timesheet_entry is set by find_timesheet_entry
    end

    def new
      # Pre-fill with current user and an empty TimesheetEntry object
      @timesheet_entry = TimesheetEntry.new(user: current_user)
      # If you wanted to pre-select a project based on context (e.g., if nested under projects)
      # @timesheet_entry.project = @project if @project
    end

    def create
      @timesheet_entry = TimesheetEntry.new(timesheet_entry_params)
      @timesheet_entry.user = current_user # Ensure current user is assigned to the entry

      if @timesheet_entry.save
        flash[:notice] = "Timesheet entry created successfully."
        redirect_to openproject_my_plugin.timesheet_entries_path
      else
        flash.now[:error] = @timesheet_entry.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit
      # @timesheet_entry is set by find_timesheet_entry
    end

    def update
      if @timesheet_entry.update(timesheet_entry_params)
        flash[:notice] = "Timesheet entry updated successfully."
        redirect_to openproject_my_plugin.timesheet_entry_path(@timesheet_entry)
      else
        flash.now[:error] = @timesheet_entry.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      @timesheet_entry.destroy
      flash[:notice] = "Timesheet entry deleted."
      redirect_to openproject_my_plugin.timesheet_entries_path
    end

    private

    def find_timesheet_entry
      # Finds the TimesheetEntry by ID. Add authorization logic here later if needed
      # (e.g., ensure current_user owns the entry or has specific permissions to view it)
      @timesheet_entry = TimesheetEntry.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    def timesheet_entry_params
      # Strong parameters: defines which attributes are allowed to be mass-assigned
      params.require(:timesheet_entry).permit(:project_id, :work_package_id, :duration_hours, :date, :description)
    end

    # Example if you need project context (uncomment if you nest routes under projects):
    # def find_project
    #   @project = Project.find(params[:project_id])
    # end
  end
end
  
