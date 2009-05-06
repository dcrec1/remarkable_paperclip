require File.join(File.dirname(__FILE__), "spec_helper.rb")

require 'paperclip'

create_table "people" do end
create_table "monsters" do end

class Person < ActiveRecord::Base
  has_attached_file :avatar
end

class Monster < ActiveRecord::Base
end

describe Remarkable::Paperclip do
  describe "have_attached_file" do
    it "should validate that a model has an attached file" do
      have_attached_file(:avatar).matches?(Person.new).should be_true
    end
    
    it "should validate that a model doenst has an attached file" do
      have_attached_file(:avatar).matches?(Monster.new).should be_false
    end
  end
end