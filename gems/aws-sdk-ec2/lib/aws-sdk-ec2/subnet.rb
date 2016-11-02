# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws
  module EC2
    class Subnet

      extend Aws::Deprecations

      # @overload def initialize(id, options = {})
      #   @param [String] id
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :id
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @id = extract_id(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def id
        @id
      end
      alias :subnet_id :id

      # The current state of the subnet.
      # @return [String]
      def state
        data.state
      end

      # The ID of the VPC the subnet is in.
      # @return [String]
      def vpc_id
        data.vpc_id
      end

      # The CIDR block assigned to the subnet.
      # @return [String]
      def cidr_block
        data.cidr_block
      end

      # The number of unused IP addresses in the subnet. Note that the IP
      # addresses for any stopped instances are considered unavailable.
      # @return [Integer]
      def available_ip_address_count
        data.available_ip_address_count
      end

      # The Availability Zone of the subnet.
      # @return [String]
      def availability_zone
        data.availability_zone
      end

      # Indicates whether this is the default subnet for the Availability
      # Zone.
      # @return [Boolean]
      def default_for_az
        data.default_for_az
      end

      # Indicates whether instances launched in this subnet receive a public
      # IP address.
      # @return [Boolean]
      def map_public_ip_on_launch
        data.map_public_ip_on_launch
      end

      # Any tags assigned to the subnet.
      # @return [Array<Types::Tag>]
      def tags
        data.tags
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {Subnet}.
      # Returns `self` making it possible to chain methods.
      #
      #     subnet.reload.data
      #
      # @return [self]
      def load
        resp = @client.describe_subnets(subnet_ids: [@id])
        @data = resp.subnets[0]
        self
      end
      alias :reload :load

      # @return [Types::Subnet]
      #   Returns the data for this {Subnet}. Calls
      #   {Client#describe_subnets} if {#data_loaded?} is `false`.
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

      # @example Request syntax with placeholder values
      #
      #   instance = subnet.create_instances({
      #     dry_run: false,
      #     image_id: "String", # required
      #     min_count: 1, # required
      #     max_count: 1, # required
      #     key_name: "String",
      #     security_groups: ["String"],
      #     security_group_ids: ["String"],
      #     user_data: "String",
      #     instance_type: "t1.micro", # accepts t1.micro, t2.nano, t2.micro, t2.small, t2.medium, t2.large, m1.small, m1.medium, m1.large, m1.xlarge, m3.medium, m3.large, m3.xlarge, m3.2xlarge, m4.large, m4.xlarge, m4.2xlarge, m4.4xlarge, m4.10xlarge, m4.16xlarge, m2.xlarge, m2.2xlarge, m2.4xlarge, cr1.8xlarge, r3.large, r3.xlarge, r3.2xlarge, r3.4xlarge, r3.8xlarge, x1.16xlarge, x1.32xlarge, i2.xlarge, i2.2xlarge, i2.4xlarge, i2.8xlarge, hi1.4xlarge, hs1.8xlarge, c1.medium, c1.xlarge, c3.large, c3.xlarge, c3.2xlarge, c3.4xlarge, c3.8xlarge, c4.large, c4.xlarge, c4.2xlarge, c4.4xlarge, c4.8xlarge, cc1.4xlarge, cc2.8xlarge, g2.2xlarge, g2.8xlarge, cg1.4xlarge, p2.xlarge, p2.8xlarge, p2.16xlarge, d2.xlarge, d2.2xlarge, d2.4xlarge, d2.8xlarge
      #     placement: {
      #       availability_zone: "String",
      #       group_name: "String",
      #       tenancy: "default", # accepts default, dedicated, host
      #       host_id: "String",
      #       affinity: "String",
      #     },
      #     kernel_id: "String",
      #     ramdisk_id: "String",
      #     block_device_mappings: [
      #       {
      #         virtual_name: "String",
      #         device_name: "String",
      #         ebs: {
      #           snapshot_id: "String",
      #           volume_size: 1,
      #           delete_on_termination: false,
      #           volume_type: "standard", # accepts standard, io1, gp2, sc1, st1
      #           iops: 1,
      #           encrypted: false,
      #         },
      #         no_device: "String",
      #       },
      #     ],
      #     monitoring: {
      #       enabled: false, # required
      #     },
      #     disable_api_termination: false,
      #     instance_initiated_shutdown_behavior: "stop", # accepts stop, terminate
      #     private_ip_address: "String",
      #     client_token: "String",
      #     additional_info: "String",
      #     network_interfaces: [
      #       {
      #         network_interface_id: "String",
      #         device_index: 1,
      #         subnet_id: "String",
      #         description: "String",
      #         private_ip_address: "String",
      #         groups: ["String"],
      #         delete_on_termination: false,
      #         private_ip_addresses: [
      #           {
      #             private_ip_address: "String", # required
      #             primary: false,
      #           },
      #         ],
      #         secondary_private_ip_address_count: 1,
      #         associate_public_ip_address: false,
      #       },
      #     ],
      #     iam_instance_profile: {
      #       arn: "String",
      #       name: "String",
      #     },
      #     ebs_optimized: false,
      #   })
      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [required, String] :image_id
      #   The ID of the AMI, which you can get by calling DescribeImages.
      # @option options [required, Integer] :min_count
      #   The minimum number of instances to launch. If you specify a minimum
      #   that is more instances than Amazon EC2 can launch in the target
      #   Availability Zone, Amazon EC2 launches no instances.
      #
      #   Constraints: Between 1 and the maximum number you're allowed for the
      #   specified instance type. For more information about the default
      #   limits, and how to request an increase, see [How many instances can I
      #   run in Amazon EC2][1] in the Amazon EC2 General FAQ.
      #
      #
      #
      #   [1]: http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2
      # @option options [required, Integer] :max_count
      #   The maximum number of instances to launch. If you specify more
      #   instances than Amazon EC2 can launch in the target Availability Zone,
      #   Amazon EC2 launches the largest possible number of instances above
      #   `MinCount`.
      #
      #   Constraints: Between 1 and the maximum number you're allowed for the
      #   specified instance type. For more information about the default
      #   limits, and how to request an increase, see [How many instances can I
      #   run in Amazon EC2][1] in the Amazon EC2 FAQ.
      #
      #
      #
      #   [1]: http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2
      # @option options [String] :key_name
      #   The name of the key pair. You can create a key pair using
      #   CreateKeyPair or ImportKeyPair.
      #
      #   If you do not specify a key pair, you can't connect to the instance
      #   unless you choose an AMI that is configured to allow users another way
      #   to log in.
      # @option options [Array<String>] :security_groups
      #   \[EC2-Classic, default VPC\] One or more security group names. For a
      #   nondefault VPC, you must use security group IDs instead.
      #
      #   Default: Amazon EC2 uses the default security group.
      # @option options [Array<String>] :security_group_ids
      #   One or more security group IDs. You can create a security group using
      #   CreateSecurityGroup.
      #
      #   Default: Amazon EC2 uses the default security group.
      # @option options [String] :user_data
      #   The user data to make available to the instance. For more information,
      #   see [Running Commands on Your Linux Instance at Launch][1] (Linux) and
      #   [Adding User Data][2] (Windows). If you are using an AWS SDK or
      #   command line tool, Base64-encoding is performed for you, and you can
      #   load the text from a file. Otherwise, you must provide Base64-encoded
      #   text.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
      #   [2]: http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html#instancedata-add-user-data
      # @option options [String] :instance_type
      #   The instance type. For more information, see [Instance Types][1] in
      #   the *Amazon Elastic Compute Cloud User Guide*.
      #
      #   Default: `m1.small`
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html
      # @option options [Types::Placement] :placement
      #   The placement for the instance.
      # @option options [String] :kernel_id
      #   The ID of the kernel.
      #
      #   We recommend that you use PV-GRUB instead of kernels and RAM disks.
      #   For more information, see [ PV-GRUB][1] in the *Amazon Elastic Compute
      #   Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html
      # @option options [String] :ramdisk_id
      #   The ID of the RAM disk.
      #
      #   We recommend that you use PV-GRUB instead of kernels and RAM disks.
      #   For more information, see [ PV-GRUB][1] in the *Amazon Elastic Compute
      #   Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html
      # @option options [Array<Types::BlockDeviceMapping>] :block_device_mappings
      #   The block device mapping.
      #
      #   Supplying both a snapshot ID and an encryption value as arguments for
      #   block-device mapping results in an error. This is because only blank
      #   volumes can be encrypted on start, and these are not created from a
      #   snapshot. If a snapshot is the basis for the volume, it contains data
      #   by definition and its encryption status cannot be changed using this
      #   action.
      # @option options [Types::RunInstancesMonitoringEnabled] :monitoring
      #   The monitoring for the instance.
      # @option options [Boolean] :disable_api_termination
      #   If you set this parameter to `true`, you can't terminate the instance
      #   using the Amazon EC2 console, CLI, or API; otherwise, you can. If you
      #   set this parameter to `true` and then later want to be able to
      #   terminate the instance, you must first change the value of the
      #   `disableApiTermination` attribute to `false` using
      #   ModifyInstanceAttribute. Alternatively, if you set
      #   `InstanceInitiatedShutdownBehavior` to `terminate`, you can terminate
      #   the instance by running the shutdown command from the instance.
      #
      #   Default: `false`
      # @option options [String] :instance_initiated_shutdown_behavior
      #   Indicates whether an instance stops or terminates when you initiate
      #   shutdown from the instance (using the operating system command for
      #   system shutdown).
      #
      #   Default: `stop`
      # @option options [String] :private_ip_address
      #   \[EC2-VPC\] The primary IP address. You must specify a value from the
      #   IP address range of the subnet.
      #
      #   Only one private IP address can be designated as primary. Therefore,
      #   you can't specify this parameter if `PrivateIpAddresses.n.Primary` is
      #   set to `true` and `PrivateIpAddresses.n.PrivateIpAddress` is set to an
      #   IP address.
      #
      #   You cannot specify this option if you're launching more than one
      #   instance in the request.
      #
      #   Default: We select an IP address from the IP address range of the
      #   subnet.
      # @option options [String] :client_token
      #   Unique, case-sensitive identifier you provide to ensure the
      #   idempotency of the request. For more information, see [Ensuring
      #   Idempotency][1].
      #
      #   Constraints: Maximum 64 ASCII characters
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html
      # @option options [String] :additional_info
      #   Reserved.
      # @option options [Array<Types::InstanceNetworkInterfaceSpecification>] :network_interfaces
      #   One or more network interfaces.
      # @option options [Types::IamInstanceProfileSpecification] :iam_instance_profile
      #   The IAM instance profile.
      # @option options [Boolean] :ebs_optimized
      #   Indicates whether the instance is optimized for EBS I/O. This
      #   optimization provides dedicated throughput to Amazon EBS and an
      #   optimized configuration stack to provide optimal EBS I/O performance.
      #   This optimization isn't available with all instance types. Additional
      #   usage charges apply when using an EBS-optimized instance.
      #
      #   Default: `false`
      # @return [Instance::Collection]
      def create_instances(options = {})
        batch = []
        options = options.merge(subnet_id: @id)
        resp = @client.run_instances(options)
        resp.data.instances.each do |i|
          batch << Instance.new(
            id: i.instance_id,
            data: i,
            client: @client
          )
        end
        Instance::Collection.new([batch], size: batch.size)
      end

      # @example Request syntax with placeholder values
      #
      #   networkinterface = subnet.create_network_interface({
      #     description: "String",
      #     private_ip_address: "String",
      #     groups: ["String"],
      #     private_ip_addresses: [
      #       {
      #         private_ip_address: "String", # required
      #         primary: false,
      #       },
      #     ],
      #     secondary_private_ip_address_count: 1,
      #     dry_run: false,
      #   })
      # @param [Hash] options ({})
      # @option options [String] :description
      #   A description for the network interface.
      # @option options [String] :private_ip_address
      #   The primary private IP address of the network interface. If you don't
      #   specify an IP address, Amazon EC2 selects one for you from the subnet
      #   range. If you specify an IP address, you cannot indicate any IP
      #   addresses specified in `privateIpAddresses` as primary (only one IP
      #   address can be designated as primary).
      # @option options [Array<String>] :groups
      #   The IDs of one or more security groups.
      # @option options [Array<Types::PrivateIpAddressSpecification>] :private_ip_addresses
      #   One or more private IP addresses.
      # @option options [Integer] :secondary_private_ip_address_count
      #   The number of secondary private IP addresses to assign to a network
      #   interface. When you specify a number of secondary IP addresses, Amazon
      #   EC2 selects these IP addresses within the subnet range. You can't
      #   specify this option and specify more than one private IP address using
      #   `privateIpAddresses`.
      #
      #   The number of IP addresses you can assign to a network interface
      #   varies by instance type. For more information, see [Private IP
      #   Addresses Per ENI Per Instance Type][1] in the *Amazon Elastic Compute
      #   Cloud User Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @return [NetworkInterface]
      def create_network_interface(options = {})
        options = options.merge(subnet_id: @id)
        resp = @client.create_network_interface(options)
        NetworkInterface.new(
          id: resp.data.network_interface.network_interface_id,
          data: resp.data.network_interface,
          client: @client
        )
      end

      # @example Request syntax with placeholder values
      #
      #   tag = subnet.create_tags({
      #     dry_run: false,
      #     tags: [ # required
      #       {
      #         key: "String",
      #         value: "String",
      #       },
      #     ],
      #   })
      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [required, Array<Types::Tag>] :tags
      #   One or more tags. The `value` parameter is required, but if you don't
      #   want the tag to have a value, specify the parameter with no value, and
      #   we set the value to an empty string.
      # @return [Tag::Collection]
      def create_tags(options = {})
        batch = []
        options = Aws::Util.deep_merge(options, resources: [@id])
        resp = @client.create_tags(options)
        options[:tags].each do |t|
          batch << Tag.new(
            resource_id: @id,
            key: t[:key],
            value: t[:value],
            client: @client
          )
        end
        Tag::Collection.new([batch], size: batch.size)
      end

      # @example Request syntax with placeholder values
      #
      #   subnet.delete({
      #     dry_run: false,
      #   })
      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(subnet_id: @id)
        resp = @client.delete_subnet(options)
        resp.data
      end

      # @!group Associations

      # @example Request syntax with placeholder values
      #
      #   instances = subnet.instances({
      #     dry_run: false,
      #     instance_ids: ["String"],
      #     filters: [
      #       {
      #         name: "String",
      #         values: ["String"],
      #       },
      #     ],
      #   })
      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [Array<String>] :instance_ids
      #   One or more instance IDs.
      #
      #   Default: Describes all your instances.
      # @option options [Array<Types::Filter>] :filters
      #   One or more filters.
      #
      #   * `affinity` - The affinity setting for an instance running on a
      #     Dedicated Host (`default` \| `host`).
      #
      #   * `architecture` - The instance architecture (`i386` \| `x86_64`).
      #
      #   * `availability-zone` - The Availability Zone of the instance.
      #
      #   * `block-device-mapping.attach-time` - The attach time for an EBS
      #     volume mapped to the instance, for example,
      #     `2010-09-15T17:15:20.000Z`.
      #
      #   * `block-device-mapping.delete-on-termination` - A Boolean that
      #     indicates whether the EBS volume is deleted on instance termination.
      #
      #   * `block-device-mapping.device-name` - The device name for the EBS
      #     volume (for example, `/dev/sdh` or `xvdh`).
      #
      #   * `block-device-mapping.status` - The status for the EBS volume
      #     (`attaching` \| `attached` \| `detaching` \| `detached`).
      #
      #   * `block-device-mapping.volume-id` - The volume ID of the EBS volume.
      #
      #   * `client-token` - The idempotency token you provided when you
      #     launched the instance.
      #
      #   * `dns-name` - The public DNS name of the instance.
      #
      #   * `group-id` - The ID of the security group for the instance.
      #     EC2-Classic only.
      #
      #   * `group-name` - The name of the security group for the instance.
      #     EC2-Classic only.
      #
      #   * `host-id` - The ID of the Dedicated Host on which the instance is
      #     running, if applicable.
      #
      #   * `hypervisor` - The hypervisor type of the instance (`ovm` \| `xen`).
      #
      #   * `iam-instance-profile.arn` - The instance profile associated with
      #     the instance. Specified as an ARN.
      #
      #   * `image-id` - The ID of the image used to launch the instance.
      #
      #   * `instance-id` - The ID of the instance.
      #
      #   * `instance-lifecycle` - Indicates whether this is a Spot Instance or
      #     a Scheduled Instance (`spot` \| `scheduled`).
      #
      #   * `instance-state-code` - The state of the instance, as a 16-bit
      #     unsigned integer. The high byte is an opaque internal value and
      #     should be ignored. The low byte is set based on the state
      #     represented. The valid values are: 0 (pending), 16 (running), 32
      #     (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).
      #
      #   * `instance-state-name` - The state of the instance (`pending` \|
      #     `running` \| `shutting-down` \| `terminated` \| `stopping` \|
      #     `stopped`).
      #
      #   * `instance-type` - The type of instance (for example, `t2.micro`).
      #
      #   * `instance.group-id` - The ID of the security group for the instance.
      #
      #   * `instance.group-name` - The name of the security group for the
      #     instance.
      #
      #   * `ip-address` - The public IP address of the instance.
      #
      #   * `kernel-id` - The kernel ID.
      #
      #   * `key-name` - The name of the key pair used when the instance was
      #     launched.
      #
      #   * `launch-index` - When launching multiple instances, this is the
      #     index for the instance in the launch group (for example, 0, 1, 2,
      #     and so on).
      #
      #   * `launch-time` - The time when the instance was launched.
      #
      #   * `monitoring-state` - Indicates whether monitoring is enabled for the
      #     instance (`disabled` \| `enabled`).
      #
      #   * `owner-id` - The AWS account ID of the instance owner.
      #
      #   * `placement-group-name` - The name of the placement group for the
      #     instance.
      #
      #   * `platform` - The platform. Use `windows` if you have Windows
      #     instances; otherwise, leave blank.
      #
      #   * `private-dns-name` - The private DNS name of the instance.
      #
      #   * `private-ip-address` - The private IP address of the instance.
      #
      #   * `product-code` - The product code associated with the AMI used to
      #     launch the instance.
      #
      #   * `product-code.type` - The type of product code (`devpay` \|
      #     `marketplace`).
      #
      #   * `ramdisk-id` - The RAM disk ID.
      #
      #   * `reason` - The reason for the current state of the instance (for
      #     example, shows "User Initiated \[date\]" when you stop or
      #     terminate the instance). Similar to the state-reason-code filter.
      #
      #   * `requester-id` - The ID of the entity that launched the instance on
      #     your behalf (for example, AWS Management Console, Auto Scaling, and
      #     so on).
      #
      #   * `reservation-id` - The ID of the instance's reservation. A
      #     reservation ID is created any time you launch an instance. A
      #     reservation ID has a one-to-one relationship with an instance launch
      #     request, but can be associated with more than one instance if you
      #     launch multiple instances using the same launch request. For
      #     example, if you launch one instance, you'll get one reservation ID.
      #     If you launch ten instances using the same launch request, you'll
      #     also get one reservation ID.
      #
      #   * `root-device-name` - The name of the root device for the instance
      #     (for example, `/dev/sda1` or `/dev/xvda`).
      #
      #   * `root-device-type` - The type of root device that the instance uses
      #     (`ebs` \| `instance-store`).
      #
      #   * `source-dest-check` - Indicates whether the instance performs
      #     source/destination checking. A value of `true` means that checking
      #     is enabled, and `false` means checking is disabled. The value must
      #     be `false` for the instance to perform network address translation
      #     (NAT) in your VPC.
      #
      #   * `spot-instance-request-id` - The ID of the Spot instance request.
      #
      #   * `state-reason-code` - The reason code for the state change.
      #
      #   * `state-reason-message` - A message that describes the state change.
      #
      #   * `subnet-id` - The ID of the subnet for the instance.
      #
      #   * `tag`\:*key*=*value* - The key/value combination of a tag assigned
      #     to the resource, where `tag`\:*key* is the tag's key.
      #
      #   * `tag-key` - The key of a tag assigned to the resource. This filter
      #     is independent of the `tag-value` filter. For example, if you use
      #     both the filter "tag-key=Purpose" and the filter "tag-value=X",
      #     you get any resources assigned both the tag key Purpose (regardless
      #     of what the tag's value is), and the tag value X (regardless of
      #     what the tag's key is). If you want to list only resources where
      #     Purpose is X, see the `tag`\:*key*=*value* filter.
      #
      #   * `tag-value` - The value of a tag assigned to the resource. This
      #     filter is independent of the `tag-key` filter.
      #
      #   * `tenancy` - The tenancy of an instance (`dedicated` \| `default` \|
      #     `host`).
      #
      #   * `virtualization-type` - The virtualization type of the instance
      #     (`paravirtual` \| `hvm`).
      #
      #   * `vpc-id` - The ID of the VPC that the instance is running in.
      #
      #   * `network-interface.description` - The description of the network
      #     interface.
      #
      #   * `network-interface.subnet-id` - The ID of the subnet for the network
      #     interface.
      #
      #   * `network-interface.vpc-id` - The ID of the VPC for the network
      #     interface.
      #
      #   * `network-interface.network-interface-id` - The ID of the network
      #     interface.
      #
      #   * `network-interface.owner-id` - The ID of the owner of the network
      #     interface.
      #
      #   * `network-interface.availability-zone` - The Availability Zone for
      #     the network interface.
      #
      #   * `network-interface.requester-id` - The requester ID for the network
      #     interface.
      #
      #   * `network-interface.requester-managed` - Indicates whether the
      #     network interface is being managed by AWS.
      #
      #   * `network-interface.status` - The status of the network interface
      #     (`available`) \| `in-use`).
      #
      #   * `network-interface.mac-address` - The MAC address of the network
      #     interface.
      #
      #   * `network-interface.private-dns-name` - The private DNS name of the
      #     network interface.
      #
      #   * `network-interface.source-dest-check` - Whether the network
      #     interface performs source/destination checking. A value of `true`
      #     means checking is enabled, and `false` means checking is disabled.
      #     The value must be `false` for the network interface to perform
      #     network address translation (NAT) in your VPC.
      #
      #   * `network-interface.group-id` - The ID of a security group associated
      #     with the network interface.
      #
      #   * `network-interface.group-name` - The name of a security group
      #     associated with the network interface.
      #
      #   * `network-interface.attachment.attachment-id` - The ID of the
      #     interface attachment.
      #
      #   * `network-interface.attachment.instance-id` - The ID of the instance
      #     to which the network interface is attached.
      #
      #   * `network-interface.attachment.instance-owner-id` - The owner ID of
      #     the instance to which the network interface is attached.
      #
      #   * `network-interface.addresses.private-ip-address` - The private IP
      #     address associated with the network interface.
      #
      #   * `network-interface.attachment.device-index` - The device index to
      #     which the network interface is attached.
      #
      #   * `network-interface.attachment.status` - The status of the attachment
      #     (`attaching` \| `attached` \| `detaching` \| `detached`).
      #
      #   * `network-interface.attachment.attach-time` - The time that the
      #     network interface was attached to an instance.
      #
      #   * `network-interface.attachment.delete-on-termination` - Specifies
      #     whether the attachment is deleted when an instance is terminated.
      #
      #   * `network-interface.addresses.primary` - Specifies whether the IP
      #     address of the network interface is the primary private IP address.
      #
      #   * `network-interface.addresses.association.public-ip` - The ID of the
      #     association of an Elastic IP address with a network interface.
      #
      #   * `network-interface.addresses.association.ip-owner-id` - The owner ID
      #     of the private IP address associated with the network interface.
      #
      #   * `association.public-ip` - The address of the Elastic IP address
      #     bound to the network interface.
      #
      #   * `association.ip-owner-id` - The owner of the Elastic IP address
      #     associated with the network interface.
      #
      #   * `association.allocation-id` - The allocation ID returned when you
      #     allocated the Elastic IP address for your network interface.
      #
      #   * `association.association-id` - The association ID returned when the
      #     network interface was associated with an IP address.
      # @return [Instance::Collection]
      def instances(options = {})
        batches = Enumerator.new do |y|
          options = Aws::Util.deep_merge(options, filters: [{
            name: "subnet-id",
            values: [@id]
          }])
          resp = @client.describe_instances(options)
          resp.each_page do |page|
            batch = []
            page.data.reservations.each do |r|
              r.instances.each do |i|
                batch << Instance.new(
                  id: i.instance_id,
                  data: i,
                  client: @client
                )
              end
            end
            y.yield(batch)
          end
        end
        Instance::Collection.new(batches)
      end

      # @example Request syntax with placeholder values
      #
      #   networkinterfaces = subnet.network_interfaces({
      #     dry_run: false,
      #     network_interface_ids: ["String"],
      #     filters: [
      #       {
      #         name: "String",
      #         values: ["String"],
      #       },
      #     ],
      #   })
      # @param [Hash] options ({})
      # @option options [Boolean] :dry_run
      #   Checks whether you have the required permissions for the action,
      #   without actually making the request, and provides an error response.
      #   If you have the required permissions, the error response is
      #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
      # @option options [Array<String>] :network_interface_ids
      #   One or more network interface IDs.
      #
      #   Default: Describes all your network interfaces.
      # @option options [Array<Types::Filter>] :filters
      #   One or more filters.
      #
      #   * `addresses.private-ip-address` - The private IP addresses associated
      #     with the network interface.
      #
      #   * `addresses.primary` - Whether the private IP address is the primary
      #     IP address associated with the network interface.
      #
      #   * `addresses.association.public-ip` - The association ID returned when
      #     the network interface was associated with the Elastic IP address.
      #
      #   * `addresses.association.owner-id` - The owner ID of the addresses
      #     associated with the network interface.
      #
      #   * `association.association-id` - The association ID returned when the
      #     network interface was associated with an IP address.
      #
      #   * `association.allocation-id` - The allocation ID returned when you
      #     allocated the Elastic IP address for your network interface.
      #
      #   * `association.ip-owner-id` - The owner of the Elastic IP address
      #     associated with the network interface.
      #
      #   * `association.public-ip` - The address of the Elastic IP address
      #     bound to the network interface.
      #
      #   * `association.public-dns-name` - The public DNS name for the network
      #     interface.
      #
      #   * `attachment.attachment-id` - The ID of the interface attachment.
      #
      #   * `attachment.attach.time` - The time that the network interface was
      #     attached to an instance.
      #
      #   * `attachment.delete-on-termination` - Indicates whether the
      #     attachment is deleted when an instance is terminated.
      #
      #   * `attachment.device-index` - The device index to which the network
      #     interface is attached.
      #
      #   * `attachment.instance-id` - The ID of the instance to which the
      #     network interface is attached.
      #
      #   * `attachment.instance-owner-id` - The owner ID of the instance to
      #     which the network interface is attached.
      #
      #   * `attachment.nat-gateway-id` - The ID of the NAT gateway to which the
      #     network interface is attached.
      #
      #   * `attachment.status` - The status of the attachment (`attaching` \|
      #     `attached` \| `detaching` \| `detached`).
      #
      #   * `availability-zone` - The Availability Zone of the network
      #     interface.
      #
      #   * `description` - The description of the network interface.
      #
      #   * `group-id` - The ID of a security group associated with the network
      #     interface.
      #
      #   * `group-name` - The name of a security group associated with the
      #     network interface.
      #
      #   * `mac-address` - The MAC address of the network interface.
      #
      #   * `network-interface-id` - The ID of the network interface.
      #
      #   * `owner-id` - The AWS account ID of the network interface owner.
      #
      #   * `private-ip-address` - The private IP address or addresses of the
      #     network interface.
      #
      #   * `private-dns-name` - The private DNS name of the network interface.
      #
      #   * `requester-id` - The ID of the entity that launched the instance on
      #     your behalf (for example, AWS Management Console, Auto Scaling, and
      #     so on).
      #
      #   * `requester-managed` - Indicates whether the network interface is
      #     being managed by an AWS service (for example, AWS Management
      #     Console, Auto Scaling, and so on).
      #
      #   * `source-desk-check` - Indicates whether the network interface
      #     performs source/destination checking. A value of `true` means
      #     checking is enabled, and `false` means checking is disabled. The
      #     value must be `false` for the network interface to perform network
      #     address translation (NAT) in your VPC.
      #
      #   * `status` - The status of the network interface. If the network
      #     interface is not attached to an instance, the status is `available`;
      #     if a network interface is attached to an instance the status is
      #     `in-use`.
      #
      #   * `subnet-id` - The ID of the subnet for the network interface.
      #
      #   * `tag`\:*key*=*value* - The key/value combination of a tag assigned
      #     to the resource.
      #
      #   * `tag-key` - The key of a tag assigned to the resource. This filter
      #     is independent of the `tag-value` filter. For example, if you use
      #     both the filter "tag-key=Purpose" and the filter "tag-value=X",
      #     you get any resources assigned both the tag key Purpose (regardless
      #     of what the tag's value is), and the tag value X (regardless of
      #     what the tag's key is). If you want to list only resources where
      #     Purpose is X, see the `tag`\:*key*=*value* filter.
      #
      #   * `tag-value` - The value of a tag assigned to the resource. This
      #     filter is independent of the `tag-key` filter.
      #
      #   * `vpc-id` - The ID of the VPC for the network interface.
      # @return [NetworkInterface::Collection]
      def network_interfaces(options = {})
        batches = Enumerator.new do |y|
          batch = []
          options = Aws::Util.deep_merge(options, filters: [{
            name: "subnet-id",
            values: [@id]
          }])
          resp = @client.describe_network_interfaces(options)
          resp.data.network_interfaces.each do |n|
            batch << NetworkInterface.new(
              id: n.network_interface_id,
              data: n,
              client: @client
            )
          end
          y.yield(batch)
        end
        NetworkInterface::Collection.new(batches)
      end

      # @return [Vpc, nil]
      def vpc
        if data.vpc_id
          Vpc.new(
            id: data.vpc_id,
            client: @client
          )
        else
          nil
        end
      end

      # @deprecated
      # @api private
      def identifiers
        { id: @id }
      end
      deprecated(:identifiers)

      private

      def extract_id(args, options)
        value = args[0] || options.delete(:id)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :id"
        else
          msg = "expected :id to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection < Aws::Resources::Collection; end
    end
  end
end