require 'randfiles/file_list'
require 'randfiles/input'

module Randfiles
  def self.run(argv)
    input     = Randfiles::Input.new(argv)
    file_list = Randfiles::FileList.new(input.files, input.options)

    file_list.select_files
  end
end
