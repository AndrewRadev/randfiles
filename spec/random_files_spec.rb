require 'spec_helper'
require 'random_files'

describe RandomFiles do
  it "can parse a human-readable size into a byte count" do
    RandomFiles.parse_size('2B').should eq 2
    RandomFiles.parse_size('2KB').should eq 2 * 1024
    RandomFiles.parse_size('2MB').should eq 2 * 1024 * 1024
    RandomFiles.parse_size('2GB').should eq 2 * 1024 * 1024 * 1024

    RandomFiles.parse_size('2b').should eq 2

    expect { RandomFiles.parse_size('foo') }.to raise_error
  end
end
