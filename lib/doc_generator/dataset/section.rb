# frozen_string_literal: true

module DocGenerator
  class Dataset
    class Section < Base
      attr_accessor :clauses

      def initialize(id, clauses)
        @id = id
        @clauses = clauses
      end

      def text
        clauses.map(&:text).join(";")
      end
    end
  end
end