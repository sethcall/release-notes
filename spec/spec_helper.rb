Spork.prefork do

  require 'rspec/autorun'

  RSpec.configure do |config|
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus

    config.filter_run_excluding integration: true if ENV['RELEASE_NOTES_CONFIG'].nil?

    config.before(:suite) do
    end

    config.before(:each) do
    end

    config.after(:each) do
    end

    config.order = 'random'
  end
end


Spork.each_run do
  # This code will be run each time you run your specs.
end
