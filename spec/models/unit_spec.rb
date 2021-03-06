#require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Unit do

  before(:each) do
    OrganisationSession.stubs(:id => @@spec_uuid, :name => 'ecuanime')
    @params = {:name => "kilogram", :symbol => "kg", :integer => false}
  end


  it 'should create an instance' do
    Unit.create!(@params)
  end

  it 'should return yes' do
    @params[:integer] = true
    unit = Unit.create(@params)
    unit.integer?.should == "Yes"
  end

  it 'should return no' do
    unit = Unit.create(@params)
    unit.integer?.should == "No"
  end

  it 'should set default to false for unit' do
    @params.delete(:integer)
    unit = Unit.create(@params)
    unit.integer.should == false
  end

  it 'should set organisation_id' do
    unit = Unit.create(@params)
    unit.organisation_id.should == @@spec_uuid
  end
end
