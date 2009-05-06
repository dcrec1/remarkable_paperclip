require 'rubygems'

RAILS_ENV = "test"
RAILS_VERSION = ENV['RAILS_VERSION'] || '2.3.2'

gem 'activesupport', RAILS_VERSION
require 'active_support'
 
gem 'activerecord', RAILS_VERSION
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

require 'remarkable_activerecord'

dir = File.dirname(__FILE__)
require File.join(dir, "..", "lib", "remarkable_paperclip")
require File.join(dir, "model_builder")
include ModelBuilder

Remarkable.include_matchers!(Remarkable::Paperclip, Spec::Example::ExampleGroup)