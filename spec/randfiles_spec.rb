require 'spec_helper'
require 'randfiles'

describe Randfiles do
  it "can parse a human-readable size into a byte count" do
    Randfiles.parse_size('2B').should eq 2
    Randfiles.parse_size('2KB').should eq 2 * 1024
    Randfiles.parse_size('2MB').should eq 2 * 1024 * 1024
    Randfiles.parse_size('2GB').should eq 2 * 1024 * 1024 * 1024

    Randfiles.parse_size('2b').should eq 2

    expect { Randfiles.parse_size('foo') }.to raise_error
  end
end
