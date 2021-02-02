# frozen_string_literal: true

module DocGenerator
  class Template
    attr_accessor :file, :dataset, :replaced

    CLAUSE_MATCHER = /\[CLAUSE-(\d+)\]/
    SECTION_MATCHER = /\[SECTION-(\d+)\]/

    def initialize(file, dataset)
      @file = file
      @dataset = dataset
      @replaced = []
    end

    def replace
      replace_text(dataset.clauses, CLAUSE_MATCHER)
      replace_text(dataset.sections, SECTION_MATCHER)
    end

    def self.replace(file, dataset)
      new(file, dataset).replace
    end

    private

    def file_lines
      @file_lines ||= Reader::Template.call(file)
    end

    def replace_text(ary, matcher)
      file_lines.each do |line|
        match = line.match(matcher)
        next if match.nil?
        text, id = match[0], match[1]
        obj = ary.find { |elem| elem.id == id.to_i }
        line.gsub!(text, obj.text)
      end
    end
  end
end