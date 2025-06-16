$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("../../lib", __dir__)

require "open_project/my_plugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-my_plugin"
  s.version     = OpenProject::MyPlugin::VERSION

  s.authors     = "Peter Mwania"
  s.email       = "pitmwania@gmail.com"
  s.homepage    = "https://github.com/uncleBandit/ThePlugin.git"  # TODO check this URL
  s.summary     = "Enhances OpenProject with custom dashboards and data visualization."
  s.description = "This OpenProject plugin provides advanced custom dashboards, allowing users to visualize project progress"
  s.license     = "GPL-3.0-only" # e.g. "MIT" or "GPLv3"

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/}) || f.match(%r{^(.github|tmp|vendor)/}) || f.match(/\.gem$/)
  end 
  s.required_ruby_version = "~> 3.0"
# Specify the directory where executables are located (if you have any)
  s.bindir        = "exe"
  # List the executables to be installed
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # Directories that should be added to Ruby's $LOAD_PATH when the gem is loaded
  s.require_paths = ["lib"]

  # Runtime dependencies: Gems your plugin needs to function
  # IMPORTANT: Adjust '~> VERSION' based on your OpenProject version and its Rails/OpenProject-Plugins dependencies.
  #s.add_dependency "openproject-plugins", "~> 13.0" # Essential for many OpenProject plugins. Check your OpenProject version's compatibility.
  s.add_dependency "rails",  ">= 8.0.0", "< 9.0" # The Rails version compatible with your OpenProject installation.
  # Add any other gems your plugin requires, e.g.:
  # s.add_dependency "chartkick", "~> 4.0"
  # s.add_dependency "groupdate", "~> 6.0"

  # Development dependencies: Gems needed only for developing/testing your plugin
  s.add_development_dependency "bundler", "~> 2.5" # The Bundler version you are using
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec-rails", " 8.0.0" # Common testing framework
  s.add_development_dependency "rubocop", "~> 1.63" # Code style linter
end
