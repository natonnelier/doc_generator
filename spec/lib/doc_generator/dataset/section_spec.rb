# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Dataset::Section do
  let(:text1) { "The quick brown fox 1" }
  let(:text2) { "The quick brown fox 2" }
  let(:clause1) { DocGenerator::Dataset::Clause.new(1, text1) }
  let(:clause2) { DocGenerator::Dataset::Clause.new(2, text2) }
  let(:id) { 7 }

  let(:section) { described_class.new(id, [clause1, clause2]) }

  describe "#text" do
    it "returns the value on text key-val" do
      expect(section.text).to eq("#{text1};#{text2}")
    end
  end
end
