# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Reader::Template do
  subject { described_class.new(file) }
  let(:doc_line) { "Is made of [CLAUSE-3]." }
  let(:doc_size) { 6 }

  describe "#call" do
    context "when file is valid" do
      let(:file) { "spec/fixtures/files/template.txt" }
      let(:data) { subject.call }

      it "reads file and returns an Array of strings" do
        expect(data).to be_a(Array)
      end

      it "returned strings are lines in the document" do
        expect(data.include?(doc_line)).to be_truthy
      end

      it "returnes all lines in the document" do
        expect(data.size).to eq(doc_size)
      end
    end
  end
end
