module Randfiles
  class FileList
    def initialize(files, options)
      @files      = files
      @count      = options.max_count || files.count
      @size_limit = options.size_limit
    end

    def select_files
      selected = []
      total_size = 0

      @count.times do
        if @files.empty?
          break
        else
          file = pop_random_file
          size = File.size(file)

          next if @size_limit and total_size + size > @size_limit

          total_size += size
          selected << file
        end
      end

      selected
    end

    private

    def pop_random_file
      @files.delete_at(rand(@files.size))
    end
  end
end
