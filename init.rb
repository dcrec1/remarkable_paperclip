require 'remarkable_activerecord'

require File.join(File.dirname(__FILE__), "lib", "remarkable_paperclip")

Remarkable.include_matchers!(Remarkable::Paperclip, Spec::Rails::Example::ModelExampleGroup)

