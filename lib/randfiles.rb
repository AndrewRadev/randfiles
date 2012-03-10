require 'randfiles/file_list'
require 'randfiles/input'

module Randfiles
  def self.run(argv)
    limit = argv.shift

    if limit =~ /^\d+(b|kb|mb|gb)$/i
      size_limit = parse_size(limit)
      count = nil
    else
      size_limit = nil
      count = limit.to_i
    end

    files = argv.
      map { |glob| Dir[glob] }.
      inject(:+).
      reject { |f| File.directory? f }

    Cli.new(files, count, size_limit).select_files
  end
end
