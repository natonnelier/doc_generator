# frozen_string_literal: true

module DocGenerator
  class Reader
    class Template < Reader
      def call
        super
        file_lines.split("\n")
      end
    end
  end
end
