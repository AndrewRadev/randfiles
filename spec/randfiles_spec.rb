require 'spec_helper'
require 'randfiles'

describe Randfiles do
  specify "all files" do
    prepare_test_files({
      'foo' => 0,
      'bar' => 0,
    })

    randfiles.should =~ %w(foo bar)
  end

  specify "limited by count" do
    prepare_test_files({
      'foo' => 0,
      'bar' => 0,
      'baz' => 0,
    })

    randfiles('--count', '2').should have(2).items
    randfiles('--count', '4').should have(3).items
  end

  specify "limited by size" do
    prepare_test_files({
      'foo' => 1,
      'bar' => 2,
      'baz' => 2000,
    })

    randfiles('--size-limit', '1').should =~ %w(foo)
    randfiles('--size-limit', '3B').should =~ %w(foo bar)
    randfiles('--size-limit', '1KB').should =~ %w(foo bar)
    randfiles('--size-limit', '1MB').should =~ %w(foo bar baz)
    randfiles('--size-limit', '1GB').should =~ %w(foo bar baz)

    expect { randfiles('--size-limit', '1FB') }.to raise_error
  end

  specify "in separate directories" do
    prepare_test_files({
      'd/foo.txt'         => 0,
      'd/baz/foo.txt'     => 0,
      'd/baz/foo/qux.txt' => 0,
    })

    randfiles('d').should =~ %w(d/foo.txt d/baz/foo.txt d/baz/foo/qux.txt)
  end
end
