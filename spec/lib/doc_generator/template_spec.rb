# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Template do
  let(:file) { "spec/fixtures/files/template.txt" }
  let(:dataset_file) { "spec/fixtures/files/dataset.txt" }
  let(:dataset) { DocGenerator::Dataset.process(dataset_file) }

  subject { described_class.new(file, dataset) }

  describe "#replace" do
    let(:clause_line) { "Is made of The quick brown fox 3."}
    let(:section_line) { "Is made of The quick brown fox 1;The quick brown fox 2."}

    let(:replaced) { subject.replace }

    it "replace clauses lines with correspondent text" do
      expect(replaced[2]).to eq(clause_line)
    end

    it "replace section lines with correspondent text" do
      expect(replaced[4]).to eq(section_line)
    end
  end
end
