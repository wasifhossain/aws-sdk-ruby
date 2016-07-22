# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module AutoScaling
    class Tag

      extend Aws::Deprecations

      # @overload def initialize(key, resource_id, resource_type, options = {})
      #   @param [String] key
      #   @param [String] resource_id
      #   @param [String] resource_type
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :key
      #   @option options [required, String] :resource_id
      #   @option options [required, String] :resource_type
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @key = extract_key(args, options)
        @resource_id = extract_resource_id(args, options)
        @resource_type = extract_resource_type(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def key
        @key
      end

      # @return [String]
      def resource_id
        @resource_id
      end

      # @return [String]
      def resource_type
        @resource_type
      end

      # The tag value.
      # @return [String]
      def value
        data.value
      end

      # Determines whether the tag is added to new instances as they are
      # launched in the group.
      # @return [Boolean]
      def propagate_at_launch
        data.propagate_at_launch
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {Tag}.
      # Returns `self` making it possible to chain methods.
      #
      #     tag.reload.data
      #
      # @return [self]
      def load
        resp = @client.describe_tags(filters: [{
          name: "key",
          values: [@key]
        }])
        @data = resp.tags[]
        self
      end
      alias :reload :load

      # @return [Types::TagDescription]
      #   Returns the data for this {Tag}. Calls
      #   {Client#describe_tags} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Actions

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def create(options = {})
        options = Aws::Util.deep_merge(options, tags: [{
          resource_type: @resource_type,
          resource_id: @resource_id,
          key: @key
        }])
        resp = @client.create_or_update_tags(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def delete(options = {})
        options = Aws::Util.deep_merge(options, tags: [{
          resource_type: @resource_type,
          resource_id: @resource_id,
          key: @key
        }])
        resp = @client.delete_tags(options)
        resp.data
      end

      # @deprecated
      # @api private
      def identifiers
        {
          key: @key,
          resource_id: @resource_id,
          resource_type: @resource_type
        }
      end
      deprecated(:identifiers)

      private

      def extract_key(args, options)
        value = args[0] || options.delete(:key)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :key"
        else
          msg = "expected :key to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def extract_resource_id(args, options)
        value = args[1] || options.delete(:resource_id)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :resource_id"
        else
          msg = "expected :resource_id to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def extract_resource_type(args, options)
        value = args[2] || options.delete(:resource_type)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :resource_type"
        else
          msg = "expected :resource_type to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<Tag>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

        # @!group Batch Actions

        # @return [void]
        def batch_create
          batches.each do |batch|
            params = {}
            batch.each.with_index do |item, n|
              Aws::Util.deep_merge(params, {
              })
            end
            @client.operation_name(params)
          end
          nil
        end

        # @return [void]
        def batch_delete!
          batches.each do |batch|
            params = {}
            batch.each.with_index do |item, n|
              Aws::Util.deep_merge(params, {
              })
            end
            @client.operation_name(params)
          end
          nil
        end

        # @!endgroup

      end
    end
  end
end