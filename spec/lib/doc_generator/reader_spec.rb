# frozen_string_literal: true

require "spec_helper"

RSpec.describe DocGenerator::Reader do
  subject { described_class.new(file) }

  describe "#call" do
    context "when file is missing" do
      let(:file) { "missing_file" }

      it "raises FileNotFoundException error" do
        expect { subject.call }.to raise_error(DocGenerator::FileNotFoundException, "File not found")
      end
    end

    context "when file has invalid extension" do
      let(:file) { "spec/fixtures/files/invalid.php" }

      it "raises InvalidExtensionException error" do
        expect { subject.call }.to raise_error(DocGenerator::InvalidExtensionException, "File has to be .odt, .docx or .txt")
      end
    end
  end
end
