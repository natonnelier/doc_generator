# frozen_string_literal: true

module DocGenerator
  class Reader
    class Dataset < Reader
      def call
        super
        parsed_lines
      end

      private

      # returns array of Hash objects
      def parsed_lines
        eval(file_lines)
      end
    end
  end
end
