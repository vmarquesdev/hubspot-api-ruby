=begin
#Custom Workflow Actions

#Create custom workflow actions

The version of the OpenAPI document: v4

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for Hubspot::Automation::Actions::ConditionalSingleFieldDependency
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ConditionalSingleFieldDependency' do
  before do
    # run before each test
    @instance = Hubspot::Automation::Actions::ConditionalSingleFieldDependency.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ConditionalSingleFieldDependency' do
    it 'should create an instance of ConditionalSingleFieldDependency' do
      expect(@instance).to be_instance_of(Hubspot::Automation::Actions::ConditionalSingleFieldDependency)
    end
  end
  describe 'test attribute "dependency_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["CONDITIONAL_SINGLE_FIELD"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.dependency_type = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "dependent_field_names"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "controlling_field_name"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "controlling_field_value"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
