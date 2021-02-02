# frozen_string_literal: true

module DocGenerator
  class Dataset
    class Clause < Base
      def initialize(id, text)
        @id = id
        @text = text
      end
    end
  end
end