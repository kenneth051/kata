require_relative "grep.rb"

RSpec.describe Grep do
  context "without flag" do
    it "should return the line with the keyword" do
      grep = described_class.new("oneworldcoders", ["data.txt"], [])
      grep.search_matches
      expect(grep.matches).to include("welcome to oneworldcoders")
    end
  end
  context "with -n flag" do
    it "should return the line number  with the keyword" do
      grep = described_class.new("oneworldcoders", ["data.txt"], ["-n"])
      grep.search_matches
      expect(grep.matches).to include("line1: welcome to oneworldcoders")
    end
  end
  context "with -i flag" do
    it "should return the line with case sensitivity" do
      grep = described_class.new("oneworldcoders", ["data.txt"], ["-i"])
      grep.search_matches
      expect(grep.matches).to include("ONEWORLDCODERS")
    end
  end
  context "with -x flag" do
    it "should return entire line" do
      grep = described_class.new("oneworldcoders", ["data.txt"], ["-x"])
      grep.search_matches
      expect(grep.matches).to eq([])
    end
    it "should return entire line" do
      grep = described_class.new("oneworldcoders", ["data2.txt"], ["-x"])
      grep.search_matches
      expect(grep.matches).to include("oneworldcoders")
    end
  end
  context "with -l flag" do
    it "should return filenames" do
      grep = described_class.new("oneworldcoders", ["data.txt"], ["-l"])
      grep.search_matches
      expect(grep.matches).to include("data.txt")
    end
  end
  context "with multiple files" do
    it "should return matched lines from all files" do
      grep = described_class.new("oneworldcoders", ["data.txt", "data2.txt"], [])
      grep.search_matches
      expect(grep.matches).to include("oneworldcoders is found in rwanda")
    end
    it "should return filenames with matched lines" do
      grep = described_class.new("oneworldcoders", ["data.txt", "data2.txt"], ["-l"])
      grep.search_matches
      expect(grep.matches).to eq(["data.txt", "data2.txt"])
    end
  end
end
