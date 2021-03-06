# frozen_string_literal: true

module Simp
  module Packer
    # Common functions to handle the .json files generated by `rake built:auto`
    class VarsJson
      # Read a SIMP ISO vars.json file
      # @raise Error if the "simp_vars_version" is not compatible (~> 1.0)
      def self.parse_file(simp_iso_json)
        vars_data = JSON.parse(File.read(simp_iso_json))
        unless Gem::Dependency.new('', '~> 1.0').match?('', Gem::Version.new(vars_data['simp_vars_version'] || ''))
          raise %[ERROR: #{simp_iso_json}: "simp_vars_version" must be \
            "1.0.0" or greater (got '#{vars_data['simp_vars_version']}')]
        end
        vars_data
      end
    end
  end
end
