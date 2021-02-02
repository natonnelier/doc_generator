# frozen_string_literal: true

module DocGenerator
  class Printer
    DEFAULT_EXTENSION = ".txt"

    attr_accessor :file_lines

    def initialize(file_lines)
      @file_lines = file_lines
    end

    def print_screen
      file_lines.each { |line| puts line }
    end

    def print_file(name)
      File.open(name, "w+") do |f|
        f.puts(file_lines)
      end
    end

    def self.call(file_lines, opts = {})
      printer = new(file_lines)
      return printer.print_screen if opts[:screen]
      file_name = "output" + (opts[:ext] || DEFAULT_EXTENSION)
      printer.print_file(file_name)
    end
  end
end