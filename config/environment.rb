# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RailsBlog::Application.initialize!

BLOG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]