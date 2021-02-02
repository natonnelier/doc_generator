# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Printer do
  let(:file_lines) { ['The quick brown fox 1', 'The quick brown fox 2'] }
  let(:output_files) { ['output.txt', 'output.docx'] }

  describe "#self.call" do
    before {
      output_files.each { |file| File.delete(file) if Pathname.new(file).exist?}
    }

    context "when print to file" do
      it "prints output.txt by default" do
        DocGenerator::Printer.call(file_lines)
        expect(Pathname.new('output.txt')).to exist
      end

      it "prints to selected format by default" do
        DocGenerator::Printer.call(file_lines, ext: ".docx")
        expect(Pathname.new('output.docx')).to exist
      end
    end

    context "when print screen" do
      it "displays content in stout" do
        stdoutput = DocGenerator::Printer.call(file_lines, screen: true)
        expect(stdoutput).to include('The quick brown fox 1')
      end
    end
  end
end
