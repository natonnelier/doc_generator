# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Dataset do
  let(:file) { "spec/fixtures/files/dataset.txt" }
  let(:clause_text1) { 'The quick brown fox 1' }
  let(:section_text1) { 'The quick brown fox 1;The quick brown fox 2' }

  subject { described_class.new(file) }

  describe "#process" do
    before { subject.process }

    it "populates clauses with an array of Clause objects" do
      expect(subject.clauses).to be_a(Array)
    end

    it "clauses respond to :text method" do
      expect(subject.clauses.first.text).to eq(clause_text1)
    end

    it "populates sections with an array of Section objects" do
      expect(subject.sections).to be_a(Array)
    end

    it "clauses respond to :text method" do
      expect(subject.sections.first.text).to eq(section_text1)
    end
  end

  describe "#self.process" do
    it "should return a Dataset object" do
      expect(DocGenerator::Dataset.process(file)).to be_a(DocGenerator::Dataset)
    end
  end
end
