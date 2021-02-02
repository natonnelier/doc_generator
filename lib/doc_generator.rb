# frozen_string_literal: true

require 'doc_generator/generator'

module DocGenerator
  def self.format(template, dataset, opts = {})
    DocGenerator::Generator.format(template, dataset, opts)
  end
end
