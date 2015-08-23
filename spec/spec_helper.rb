require 'simplecov'
SimpleCov.command_name 'test:units'

# Load lib folder
Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each { |file| require file }
