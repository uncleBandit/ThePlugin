# openproject-my_plugin/config/routes.rb
OpenProject::MyPlugin::Engine.routes.draw do
  resources :timesheet_entries # Standard RESTful routes

  # You might want to nest under projects, for example:
  # resources :projects do
  #   resources :timesheet_entries, only: [:index, :new, :create]
  # end
end
