require_relative "numbers.rb"
RSpec.describe Numbers do
  context "convert numbers to words" do
    it "returns 1 in words" do
      num = described_class.new(1)
      num.convert
      expect(num.numbers_to_words).to eq("one")
    end
    it "returns 11 in words" do
      num = described_class.new(11)
      num.convert
      expect(num.numbers_to_words).to eq("eleven")
    end
    it "returns 21 in words" do
      num = described_class.new(21)
      num.convert
      expect(num.numbers_to_words).to eq("twenty one")
    end
    it "returns 99 in words" do
      num = described_class.new(99)
      num.convert
      expect(num.numbers_to_words).to eq("ninety nine")
    end
    it "returns 100 in words" do
      num = described_class.new(100)
      num.convert
      expect(num.numbers_to_words).to eq("one hundred ")
    end
    it "returns 100 in words" do
      num = described_class.new(111)
      num.convert
      expect(num.numbers_to_words).to eq("one hundred eleven")
    end
    it "returns 999 in words" do
      num = described_class.new(999)
      num.convert
      expect(num.numbers_to_words).to eq("nine hundred ninety nine")
    end
    it "returns 1000 in words" do
      num = described_class.new(1000)
      num.convert
      expect(num.numbers_to_words).to eq("one thousand ")
    end
    it "returns 8976 in words" do
      num = described_class.new(8976)
      num.convert
      expect(num.numbers_to_words).to eq("eight thousand nine hundred seventy six")
    end
  end
end
