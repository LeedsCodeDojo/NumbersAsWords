require 'spec_helper'
require_relative '../lib/number_string'

describe NumberString do
  it "describes single digits" do
    ns = NumberString.new

    expect(ns.to_string(number: 0)).to eq("zero")
    expect(ns.to_string(number: 3)).to eq("three")
    expect(ns.to_string(number: 4)).to eq("four")
    expect(ns.to_string(number: 9)).to eq("nine")
  end

  it "describes double digits" do
    ns = NumberString.new

    expect(ns.to_string(number: 23)).to eq("twenty three")
    expect(ns.to_string(number: 20)).to eq("twenty")
    expect(ns.to_string(number: 34)).to eq("thirty four")
    expect(ns.to_string(number: 99)).to eq("ninety nine")
  end

  it "describes triple digits" do
    ns = NumberString.new

    expect(ns.to_string(number: 100)).to eq("one hundred")
    expect(ns.to_string(number: 109)).to eq("one hundred nine")
  end
end
