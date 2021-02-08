=begin
#Accounting Extension

#These APIs allow you to interact with HubSpot's Accounting Extension. It allows you to: * Specify the URLs that HubSpot will use when making webhook requests to your external accounting system. * Respond to webhook calls made to your external accounting system by HubSpot 

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'

# Unit tests for Hubspot::Crm::Extensions::Accounting::SyncApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'SyncApi' do
  before do
    # run before each test
    @api_instance = Hubspot::Crm::Extensions::Accounting::SyncApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SyncApi' do
    it 'should create an instance of SyncApi' do
      expect(@api_instance).to be_instance_of(Hubspot::Crm::Extensions::Accounting::SyncApi)
    end
  end

  # unit tests for create_contact
  # Import contacts
  # Imports contacts&#39; properties from an external accounting system to HubSpot. Import details, including property mappings, must be configured previously in HubSpot infrastructure.
  # @param app_id The ID of the accounting app. This is the identifier of the application created in your HubSpot developer portal.
  # @param sync_contacts_request 
  # @param [Hash] opts the optional parameters
  # @return [ActionResponse]
  describe 'create_contact test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_product
  # Import products
  # Imports products&#39; properties from an external accounting system to HubSpot. Import details, including property mappings, must be configured previously in HubSpot infrastructure.
  # @param app_id The ID of the accounting app. This is the identifier of the application created in your HubSpot developer portal.
  # @param sync_products_request 
  # @param [Hash] opts the optional parameters
  # @return [ActionResponse]
  describe 'create_product test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end