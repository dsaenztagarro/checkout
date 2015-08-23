require 'simplecov'
SimpleCov.command_name 'test:integration'

# Load lib folder
Dir[File.dirname(__FILE__) + '/../../lib/**/*.rb'].each { |file| require file }
