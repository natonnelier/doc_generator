# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator do
  let(:template_file) { "spec/fixtures/files/template.txt" }
  let(:dataset_file) { "spec/fixtures/files/dataset.txt" }
  let(:output_txt) { 'output.txt' }
  let(:output_docx) { 'output.docx' }
  let(:output_files) { [output_txt, output_docx] }

  subject { described_class }

  describe "#self.format" do
    let(:clause_line) { "Is made of The quick brown fox 3."}

    context "on printing a file" do
      before {
        output_files.each { |file| File.delete(file) if Pathname.new(file).exist?}
      }

      it "outputs .txt if no extension option included" do
        subject.format(template_file, dataset_file)
        expect(Pathname.new(output_txt)).to exist
      end

      it "outputs file with the required extension" do
        subject.format(template_file, dataset_file, ext: ".docx")
        expect(Pathname.new(output_docx)).to exist
      end

      it "includes replaced text" do
        subject.format(template_file, dataset_file)
        file_txt = File.read(output_txt)
        expect(file_txt.include?(clause_line)).to be_truthy
      end
    end

    context "on console output" do
      it "displays response" do
        stdoutput = subject.format(template_file, dataset_file, screen: true)
        expect(stdoutput).to include(clause_line)
      end
    end
  end
end
