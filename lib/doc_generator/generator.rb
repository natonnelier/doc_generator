# frozen_string_literal: true

module DocGenerator
  class Generator
    attr_accessor :template, :dataset

    def initialize(template, dataset)
      @template = template
      @dataset = dataset
    end

    def format(opts = {})
      print_template(opts)
    end

    def self.format(template, dataset, opts = {})
      generator = new(template, dataset)
      generator.format(opts)
    end

    private

    def processed_dataset
      @processed_dataset ||= Dataset.process(dataset)
    end

    def replaced_template
      @replaced_template ||= Template.replace(template, processed_dataset)
    end

    def print_template(opts = {})
      Printer.call(replaced_template, opts)
    end
  end
end
