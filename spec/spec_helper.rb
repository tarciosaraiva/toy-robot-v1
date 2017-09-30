require 'rubygems'
require 'fileutils'
require 'bundler/setup'

Bundler.require(:default, :test, :development)

ENV["APP_ENV"] ||= "test"

lib_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
log_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'log'))

$:.unshift lib_dir

require 'simulation'

RSpec.configure do |config|
  config.before(:all) do
    # create log directory
    FileUtils.mkdir log_dir unless Dir.exist? 'log'
  end

  config.after(:all) do
    # remove log directory
    FileUtils.remove_dir log_dir
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
