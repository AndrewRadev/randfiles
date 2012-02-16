require 'random_files/cli'

module RandomFiles
  def self.run(argv)
    limit = argv.shift.to_i
    files = argv.
      map { |glob| Dir[glob] }.
      inject(:+).
      reject { |f| File.directory? f }

    Cli.new(files, limit).select_files
  end
end
