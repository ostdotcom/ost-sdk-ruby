module OSTSdk

  module Util

    class CommonValidator

      # Check for numeric-ness of an input
      #
      # Arguments:
      #   object: (Float)
      #
      # Returns:
      #   Boolean
      #
      def self.is_numeric?(object)
        true if Float(object) rescue false
      end

      #
      #
      # Arguments:
      #   object: (Boolean)
      #
      # Returns:
      #   Boolean
      #
      def self.is_boolean?(object)
        [
            true,
            false
        ].include?(object)
      end

      # Is the given object Hash
      #
      # Arguments:
      #   object: (Hash)
      #
      # Returns:
      #   Boolean
      #
      def self.is_a_hash?(obj)
        obj.is_a?(Hash) || obj.is_a?(ActionController::Parameters)
      end

    end

  end

end
