require 'random_files/cli'

module RandomFiles
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

  def self.parse_size(size)
    size, modifier = /^(\d+)(.*)$/.match(size) { [$1.to_i, $2] }

    case modifier.upcase
    when 'B'  then size
    when 'KB' then size * 1024
    when 'MB' then size * 1024 * 1024
    when 'GB' then size * 1024 * 1024 * 1024
    else raise "Can't parse size: #{size}"
    end
  end
end
