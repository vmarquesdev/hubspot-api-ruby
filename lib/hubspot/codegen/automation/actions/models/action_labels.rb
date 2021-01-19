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
      class ActionLabels
        # A map of input field names to the user-facing labels.
        attr_accessor :input_field_labels

        # A map of input field names to descriptions for the fields. These will show up as tooltips when users are editing your action.
        attr_accessor :input_field_descriptions

        # The name of this custom action. This is what will show up when users are selecting an action in the workflows app.
        attr_accessor :action_name

        # A description for this custom action. This will show up in the action editor along with the input fields.
        attr_accessor :action_description

        # The name to be displayed at the top of the action editor in the workflows app.
        attr_accessor :app_display_name

        # The label to be displayed in the action card of the workflow editor once this custom action has been added to a workflow.
        attr_accessor :action_card_content

        # Attribute mapping from ruby-style variable name to JSON key.
        def self.attribute_map
          {
            :'input_field_labels' => :'inputFieldLabels',
            :'input_field_descriptions' => :'inputFieldDescriptions',
            :'action_name' => :'actionName',
            :'action_description' => :'actionDescription',
            :'app_display_name' => :'appDisplayName',
            :'action_card_content' => :'actionCardContent'
          }
        end

        # Attribute type mapping.
        def self.openapi_types
          {
            :'input_field_labels' => :'Hash<String, String>',
            :'input_field_descriptions' => :'Hash<String, String>',
            :'action_name' => :'String',
            :'action_description' => :'String',
            :'app_display_name' => :'String',
            :'action_card_content' => :'String'
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
            fail ArgumentError, "The input argument (attributes) must be a hash in `Hubspot::Automation::Actions::ActionLabels` initialize method"
          end

          # check to see if the attribute exists and convert string to symbol for hash key
          attributes = attributes.each_with_object({}) { |(k, v), h|
            if (!self.class.attribute_map.key?(k.to_sym))
              fail ArgumentError, "`#{k}` is not a valid attribute in `Hubspot::Automation::Actions::ActionLabels`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
            end
            h[k.to_sym] = v
          }

          if attributes.key?(:'input_field_labels')
            if (value = attributes[:'input_field_labels']).is_a?(Hash)
              self.input_field_labels = value
            end
          end

          if attributes.key?(:'input_field_descriptions')
            if (value = attributes[:'input_field_descriptions']).is_a?(Hash)
              self.input_field_descriptions = value
            end
          end

          if attributes.key?(:'action_name')
            self.action_name = attributes[:'action_name']
          end

          if attributes.key?(:'action_description')
            self.action_description = attributes[:'action_description']
          end

          if attributes.key?(:'app_display_name')
            self.app_display_name = attributes[:'app_display_name']
          end

          if attributes.key?(:'action_card_content')
            self.action_card_content = attributes[:'action_card_content']
          end
        end

        # Show invalid properties with the reasons. Usually used together with valid?
        # @return Array for valid properties with the reasons
        def list_invalid_properties
          invalid_properties = Array.new
          if @action_name.nil?
            invalid_properties.push('invalid value for "action_name", action_name cannot be nil.')
          end

          invalid_properties
        end

        # Check to see if the all the properties in the model are valid
        # @return true if the model is valid
        def valid?
          return false if @action_name.nil?
          true
        end

        # Checks equality by comparing each attribute.
        # @param [Object] Object to be compared
        def ==(o)
          return true if self.equal?(o)
          self.class == o.class &&
              input_field_labels == o.input_field_labels &&
              input_field_descriptions == o.input_field_descriptions &&
              action_name == o.action_name &&
              action_description == o.action_description &&
              app_display_name == o.app_display_name &&
              action_card_content == o.action_card_content
        end

        # @see the `==` method
        # @param [Object] Object to be compared
        def eql?(o)
          self == o
        end

        # Calculates hash code according to all attributes.
        # @return [Integer] Hash code
        def hash
          [input_field_labels, input_field_descriptions, action_name, action_description, app_display_name, action_card_content].hash
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
