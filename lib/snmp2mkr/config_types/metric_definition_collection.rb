require 'snmp2mkr/config_types/base'
require 'snmp2mkr/config_types/metric_definition'

module Snmp2mkr
  module ConfigTypes
    class MetricDefinitionCollection < Base
      def setup(hash)
        if !hash.kind_of?(Hash) || hash.any? { |k,v| !k.kind_of?(String) }
          raise TypeError, "#{self.class} must be given a Hash<String, Object)>"
        end

        @value = hash.map { |k, v| [k, MetricDefinition.new([k,v])] }.to_h
      end

      def [](k)
        @value[k]
      end

      def collect_children
        @value.values
      end

      attr_reader :value
    end
  end
end
