# frozen_string_literal: true

module DocGenerator
  class Reader
    VALID_EXTENSIONS = %w[.odt .docx .txt].freeze

    attr_accessor :file

    def initialize(file)
      @file = file
    end

    def call
      validate_presence
      validate_extension
    end

    def self.call(file)
      new(file).call
    end

    private

    def validate_extension
      unless VALID_EXTENSIONS.include? File.extname(file)
        raise InvalidExtensionException, "File has to be .odt, .docx or .txt"
      end
    end

    def validate_presence
      raise FileNotFoundException, "File not found" unless file && File.exist?(file)
    end

    def file_lines
      @file_lines ||= File.read file
    end

    # returns array of Hash objects
    def parsed_lines
      eval(file_lines)
    end
  end
end