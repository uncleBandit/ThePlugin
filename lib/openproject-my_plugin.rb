
# lib/openproject-my_plugin.rb
require 'open_project/plugins'

module OpenProject::MyPlugin
  class Engine < ::Rails::Engine
  
    include OpenProject::Plugins::ActsAsOpEngine
    engine_name :openproject_my_plugin   
    #requires_openproject '>= 13.0.0'


    register 'openproject-my_plugin', # <-- CORRECTED: Use hyphen consistency here.
             author_url: 'https://github.com/uncleBandit', # Use your consistent URL
             name: 'My Custom Timesheet Plugin', # <--- THIS LINE IS CRUCIAL AND WAS MISSING!
             description: 'A custom timesheet management plugin for OpenProject.', # <--- This was also missing
             url: 'https://github.com/uncleBandit/ThePlugin.git', # <--- This was also missing
            # bundled: false, # Set to true if this plugin is bundled with OpenProject core (usually false for custom plugins)
            # wiki_url: nil, # <--- This was also missing
            
             settings: { # Define default settings for your plugin (also missing)
               'default' => { 'enabled' => true },
               'partial' => 'openproject_my_plugin/settings/plugin_settings' # Path to a settings view
             } do |plugin| # This 'do' block holds the menu items and project modules 

  

    # This defines permissions for your plugin's features
    plugin.project_module :timesheet_management do
      permission :view_timesheets, { 'open_project/my_plugin/timesheet_entries' => [:index, :show] }, public: false, permissible_on: [:project]
      permission :manage_timesheets, { 'open_project/my_plugin/timesheet_entries' => [:new, :create, :edit, :update, :destroy] },
                                                                                   public: false, permissible_on: [:project]
     end
    end

    initializer 'my_plugin.hooks' do
      # Hook initialization if needed
    end

    # This block is important for patches or initializers (keep if present, add if you need it)
    config.to_prepare do
      # Example: If you needed to patch an OpenProject core class
      # WorkPackage.include(OpenProject::MyPlugin::Patches::WorkPackagePatch)
    end
  end
end
