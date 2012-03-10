require 'ostruct'
require 'optparse'
require 'randfiles/version'

module Randfiles
  class Input
    attr_reader :options

    def initialize(args)
      @options = OpenStruct.new
      @globs   = []

      parse_args(args)
    end

    def files
      @globs.
        map { |g| Dir[g] }.
        flatten.
        select { |f| File.file?(f) }
    end

    private

    def parse_args(args)
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: randfiles [options] [dir1, [dir2, [...]]]"

        opts.on '-s', '--size-limit [SIZE]', 'Size limit for random file list. E.g. "400MB", "3GB"' do |size|
          @options.size_limit = parse_size(size)
        end
        opts.on '-c', '--count [N]', Integer, 'Maximum number of files to list' do |count|
          @options.max_count = count
        end

        opts.on_tail('-h', '--help', 'Show this message') { puts opts               ; exit }
        opts.on_tail('--version', 'Show version')         { puts Randfiles::VERSION ; exit }
      end

      @globs = parser.permute(args)
      @globs = ['*/**'] if @globs.empty?
    end

    def parse_size(size)
      return size.to_i if size =~ /^\d+$/

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
end
