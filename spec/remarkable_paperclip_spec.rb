require File.join(File.dirname(__FILE__), "spec_helper.rb")

require 'paperclip'

create_table "people" do end

class Person < ActiveRecord::Base
  has_attached_file :avatar
  has_attached_file :logo, :styles => { :medium => "300x300", :thumb => "80x80" }
end

describe Remarkable::Paperclip do
  before :each do
    @model = Person.new
  end

  describe "have_attached_file" do
    it "should validate that a model has an attached file" do
      have_attached_file(:avatar).matches?(@model).should be_true
    end
    
    it "should validate that a model doenst has an attached file" do
      have_attached_file(:photo).matches?(@model).should be_false
    end
    
    it "should validate an attached file has styles" do
      have_attached_file(:logo, :styles => { :medium => "300x300", :thumb => "80x80" }).matches?(@model).should be_true
    end
    
    it "should validate an attached file doesn't has styles" do
      have_attached_file(:logo, :styles => { :medium => "400x400", :thumb => "90x90" }).matches?(@model).should be_false
    end
  end
end
