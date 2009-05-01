require 'rubygems'
require 'active_record'
require 'paperclip'
require 'lib/remarkable_paperclip'

class Person < ActiveRecord::Base
  has_attached_file :avatar
end

class Monster < ActiveRecord::Base
end

describe Remarkable::Paperclip do
  describe "have_attached_file" do
    it "should validate that a model has an attached file" do
      have_attached_file(:avatar).matches(Person).should be_true
    end
    
    it "should validate that a model doenst has an attached file" do
      have_attached_file(:avatar).matches(Monster).should be_false
    end
  end
end