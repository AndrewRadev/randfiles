require 'pp'
require 'simplecov'
require 'fileutils'

SimpleCov.start

ROOT_DIR = File.expand_path('../..', __FILE__)

RSpec.configure do |config|
  config.before :each do
    FileUtils.cd ROOT_DIR
    FileUtils.rm_rf 'tmp' if File.exists? 'tmp'
    FileUtils.mkdir 'tmp'
    FileUtils.cd 'tmp'
  end

  config.after :each do
    FileUtils.cd ROOT_DIR
    FileUtils.rm_rf 'tmp' if File.exists? 'tmp'
  end
end

def prepare_test_files(files)
  files.each do |name, size|
    parent_dir = File.dirname(name)
    FileUtils.mkdir_p parent_dir if not File.directory? parent_dir
    File.open(name, 'wb') { |f| f.write('x' * size) }
  end
end

def randfiles(*args)
  Randfiles.run(args)
end
