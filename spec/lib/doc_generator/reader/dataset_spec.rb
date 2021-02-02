# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Reader::Dataset do
  subject { described_class.new(file) }
  let(:text) { "The quick brown fox 1" }
  let(:doc_size) { 7 }

  describe "#call" do
    context "when file is valid" do
      let(:file) { "spec/fixtures/files/dataset.txt" }
      let(:data) { subject.call }

      it "reads file and returns an Array of hashes" do
        expect(data).to be_a(Array)
      end

      it "returned hashes include :id and :text parsed from content in the document" do
        expect(data.first[:id]).to eq(1)
        expect(data.first[:text]).to eq(text)
      end

      it "returnes all lines in the document" do
        expect(data.size).to eq(doc_size)
      end
    end
  end
end
