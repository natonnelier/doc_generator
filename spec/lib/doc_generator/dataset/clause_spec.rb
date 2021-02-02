# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Dataset::Clause do
  let(:text) { "The quick brown fox 1" }
  let(:id) { 7 }
  let(:clause) { described_class.new(id, text) }

  describe "#text" do
    it "returns the value on text key-val" do
      expect(clause.text).to eq(text)
    end
  end
end
