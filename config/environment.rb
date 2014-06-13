# Load the Rails application.
require File.expand_path('../application', __FILE__)

code_revision = `git log --pretty=format:%h -n1`.strip
ENV["RAILS_CACHE_ID"] = code_revision

# Initialize the Rails application.
Transportation::Application.initialize!
