module RandomFiles
  class Cli
    def initialize(files, limit)
      @files = files
      @limit = limit
    end

    def select_files
      selected = []

      @limit.times do
        if @files.empty?
          break
        else
          selected << pop_random_file
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
