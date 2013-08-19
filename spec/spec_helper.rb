ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'email_spec' 
Capybara.javascript_driver = :webkit
Capybara.ignore_hidden_elements = true
 
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
 
# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
 
RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false
  config.include FactoryGirl::Syntax::Methods
  config.include EmailSpec::Helpers
  config.include TimeTestHelpers


  # add :focus on a spec to run only that spec
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  #config.include Devise::TestHelpers, :type => :controller    

  config.before(:each) do
    if Capybara.current_driver == :rack_test 
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start  
    else
      Capybara.server_port = 7171
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean      
  end

  config.after(:all) do
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
