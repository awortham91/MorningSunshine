require "spec_helper"

describe Weather do
  let(:weather) {Weather.new}
  describe "#time" do
    it "will print a time in AM or PM" do
      expect(weather.time(0)).to match(/(AM|PM)/)

    end
  end
end
