require "spec_helper"

describe Quote do
  describe "#new_quote" do
    let(:quote) {Quote.new}
    it "will print a string containing a quote" do
      expect(quote.new_quote.class).to eq(String)
      expect(quote.new_quote.length).to be > 4
    end
  end
end
