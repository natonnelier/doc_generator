# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Generator do
  let(:template_file) { "spec/fixtures/files/template.txt" }
  let(:dataset_file) { "spec/fixtures/files/dataset.txt" }
  let(:output_files) { ['output.txt', 'output.docx'] }

  subject { described_class.new(template_file, dataset_file) }

  describe "#format" do
    let(:clause_line) { "Is made of The quick brown fox 3."}

    before {
      output_files.each { |file| File.delete(file) if Pathname.new(file).exist?}
    }

    it "prints default output.txt" do
      subject.format
      expect(Pathname.new('output.txt')).to exist
    end

    it "prints output with extension set in options" do
      subject.format(ext: ".docx")
      expect(Pathname.new('output.docx')).to exist
    end
  end
end
