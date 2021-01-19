=begin
#Custom Workflow Actions

#Create custom workflow actions

The version of the OpenAPI document: v4

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'date'

module Hubspot
  module Automation
    module Actions
      class ExtensionActionDefinitionInput
        # A list of functions associated with the custom workflow action.
        attr_accessor :functions

        # The URL that will accept an HTTPS request each time workflows executes the custom action.
        attr_accessor :action_url

        # Whether this custom action is published to customers.
        attr_accessor :published

        # The date that this custom action was archived, if the custom action is archived.
        attr_accessor :archived_at

        # The list of input fields to display in this custom action.
        attr_accessor :input_fields

        attr_accessor :object_request_options

        # A list of dependencies between the input fields. These configure when the input fields should be visible.
        attr_accessor :input_field_dependencies

        # The user-facing labels for the custom action.
        attr_accessor :labels

        # The object types that this custom action supports.
        attr_accessor :object_types

        # Attribute mapping from ruby-style variable name to JSON key.
        def self.attribute_map
          {
            :'functions' => :'functions',
            :'action_url' => :'actionUrl',
            :'published' => :'published',
            :'archived_at' => :'archivedAt',
            :'input_fields' => :'inputFields',
            :'object_request_options' => :'objectRequestOptions',
            :'input_field_dependencies' => :'inputFieldDependencies',
            :'labels' => :'labels',
            :'object_types' => :'objectTypes'
          }
        end

        # Attribute type mapping.
        def self.openapi_types
          {
            :'functions' => :'Array<ActionFunction>',
            :'action_url' => :'String',
            :'published' => :'Boolean',
            :'archived_at' => :'Integer',
            :'input_fields' => :'Array<InputFieldDefinition>',
            :'object_request_options' => :'ObjectRequestOptions',
            :'input_field_dependencies' => :'Array<OneOfSingleFieldDependencyConditionalSingleFieldDependency>',
            :'labels' => :'Hash<String, ActionLabels>',
            :'object_types' => :'Array<String>'
          }
        end

        # List of attributes with nullable: true
        def self.openapi_nullable
          Set.new([
          ])
        end

        # Initializes the object
        # @param [Hash] attributes Model attributes in the form of hash
        def initialize(attributes = {})
          if (!attributes.is_a?(Hash))
            fail ArgumentError, "The input argument (attributes) must be a hash in `Hubspot::Automation::Actions::ExtensionActionDefinitionInput` initialize method"
          end

          # check to see if the attribute exists and convert string to symbol for hash key
          attributes = attributes.each_with_object({}) { |(k, v), h|
            if (!self.class.attribute_map.key?(k.to_sym))
              fail ArgumentError, "`#{k}` is not a valid attribute in `Hubspot::Automation::Actions::ExtensionActionDefinitionInput`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
            end
            h[k.to_sym] = v
          }

          if attributes.key?(:'functions')
            if (value = attributes[:'functions']).is_a?(Array)
              self.functions = value
            end
          end

          if attributes.key?(:'action_url')
            self.action_url = attributes[:'action_url']
          end

          if attributes.key?(:'published')
            self.published = attributes[:'published']
          end

          if attributes.key?(:'archived_at')
            self.archived_at = attributes[:'archived_at']
          end

          if attributes.key?(:'input_fields')
            if (value = attributes[:'input_fields']).is_a?(Array)
              self.input_fields = value
            end
          end

          if attributes.key?(:'object_request_options')
            self.object_request_options = attributes[:'object_request_options']
          end

          if attributes.key?(:'input_field_dependencies')
            if (value = attributes[:'input_field_dependencies']).is_a?(Array)
              self.input_field_dependencies = value
            end
          end

          if attributes.key?(:'labels')
            if (value = attributes[:'labels']).is_a?(Hash)
              self.labels = value
            end
          end

          if attributes.key?(:'object_types')
            if (value = attributes[:'object_types']).is_a?(Array)
              self.object_types = value
            end
          end
        end

        # Show invalid properties with the reasons. Usually used together with valid?
        # @return Array for valid properties with the reasons
        def list_invalid_properties
          invalid_properties = Array.new
          if @functions.nil?
            invalid_properties.push('invalid value for "functions", functions cannot be nil.')
          end

          if @action_url.nil?
            invalid_properties.push('invalid value for "action_url", action_url cannot be nil.')
          end

          if @published.nil?
            invalid_properties.push('invalid value for "published", published cannot be nil.')
          end

          if @input_fields.nil?
            invalid_properties.push('invalid value for "input_fields", input_fields cannot be nil.')
          end

          if @labels.nil?
            invalid_properties.push('invalid value for "labels", labels cannot be nil.')
          end

          if @object_types.nil?
            invalid_properties.push('invalid value for "object_types", object_types cannot be nil.')
          end

          invalid_properties
        end

        # Check to see if the all the properties in the model are valid
        # @return true if the model is valid
        def valid?
          return false if @functions.nil?
          return false if @action_url.nil?
          return false if @published.nil?
          return false if @input_fields.nil?
          return false if @labels.nil?
          return false if @object_types.nil?
          true
        end

        # Checks equality by comparing each attribute.
        # @param [Object] Object to be compared
        def ==(o)
          return true if self.equal?(o)
          self.class == o.class &&
              functions == o.functions &&
              action_url == o.action_url &&
              published == o.published &&
              archived_at == o.archived_at &&
              input_fields == o.input_fields &&
              object_request_options == o.object_request_options &&
              input_field_dependencies == o.input_field_dependencies &&
              labels == o.labels &&
              object_types == o.object_types
        end

        # @see the `==` method
        # @param [Object] Object to be compared
        def eql?(o)
          self == o
        end

        # Calculates hash code according to all attributes.
        # @return [Integer] Hash code
        def hash
          [functions, action_url, published, archived_at, input_fields, object_request_options, input_field_dependencies, labels, object_types].hash
        end

        # Builds the object from hash
        # @param [Hash] attributes Model attributes in the form of hash
        # @return [Object] Returns the model itself
        def self.build_from_hash(attributes)
          new.build_from_hash(attributes)
        end

        # Builds the object from hash
        # @param [Hash] attributes Model attributes in the form of hash
        # @return [Object] Returns the model itself
        def build_from_hash(attributes)
          return nil unless attributes.is_a?(Hash)
          self.class.openapi_types.each_pair do |key, type|
            if type =~ /\AArray<(.*)>/i
              # check to ensure the input is an array given that the attribute
              # is documented as an array but the input is not
              if attributes[self.class.attribute_map[key]].is_a?(Array)
                self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
              end
            elsif !attributes[self.class.attribute_map[key]].nil?
              self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
            end # or else data not found in attributes(hash), not an issue as the data can be optional
          end

          self
        end

        # Deserializes the data based on type
        # @param string type Data type
        # @param string value Value to be deserialized
        # @return [Object] Deserialized data
        def _deserialize(type, value)
          case type.to_sym
          when :DateTime
            DateTime.parse(value)
          when :Date
            Date.parse(value)
          when :String
            value.to_s
          when :Integer
            value.to_i
          when :Float
            value.to_f
          when :Boolean
            if value.to_s =~ /\A(true|t|yes|y|1)\z/i
              true
            else
              false
            end
          when :Object
            # generic object (usually a Hash), return directly
            value
          when /\AArray<(?<inner_type>.+)>\z/
            inner_type = Regexp.last_match[:inner_type]
            value.map { |v| _deserialize(inner_type, v) }
          when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
            k_type = Regexp.last_match[:k_type]
            v_type = Regexp.last_match[:v_type]
            {}.tap do |hash|
              value.each do |k, v|
                hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
              end
            end
          else # model
            Hubspot::Automation::Actions.const_get(type).build_from_hash(value)
          end
        end

        # Returns the string representation of the object
        # @return [String] String presentation of the object
        def to_s
          to_hash.to_s
        end

        # to_body is an alias to to_hash (backward compatibility)
        # @return [Hash] Returns the object in the form of hash
        def to_body
          to_hash
        end

        # Returns the object in the form of hash
        # @return [Hash] Returns the object in the form of hash
        def to_hash
          hash = {}
          self.class.attribute_map.each_pair do |attr, param|
            value = self.send(attr)
            if value.nil?
              is_nullable = self.class.openapi_nullable.include?(attr)
              next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
            end
            
            hash[param] = _to_hash(value)
          end
          hash
        end

        # Outputs non-array value in the form of hash
        # For object, use to_hash. Otherwise, just return the value
        # @param [Object] value Any valid value
        # @return [Hash] Returns the value in the form of hash
        def _to_hash(value)
          if value.is_a?(Array)
            value.compact.map { |v| _to_hash(v) }
          elsif value.is_a?(Hash)
            {}.tap do |hash|
              value.each { |k, v| hash[k] = _to_hash(v) }
            end
          elsif value.respond_to? :to_hash
            value.to_hash
          else
            value
          end
        end
      end
    end
  end
end
