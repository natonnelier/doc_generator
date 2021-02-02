# frozen_string_literal: true

module DocGenerator
  class Dataset
    attr_accessor :clauses, :sections

    def initialize(file)
      @file = file
      @clauses = []
      @sections = []
    end

    def process
      populate_clauses
      populate_sections
      self
    end

    def self.process(file)
      new(file).process
    end

    private

    def file_lines
      @file_lines ||= Reader::Dataset.call(@file)
    end

    def clauses_lines
      file_lines.select { |line| !line[:text].nil? }
    end

    def sections_lines
      file_lines.select { |line| !line[:clauses_ids].nil? }
    end

    def populate_clauses
      clauses_lines.each { |line| clauses << Dataset::Clause.new(line[:id], line[:text]) }
    end

    def populate_sections
      sections_lines.each do |line|
        section_clauses = line[:clauses_ids].map { |id| @clauses.find { |c| c.id == id } }
        @sections << Dataset::Section.new(line[:id], section_clauses)
      end
    end
  end
end