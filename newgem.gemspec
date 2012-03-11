require File.expand_path('../lib/randfiles/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'randfiles'
  s.version     = Randfiles::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrew Radev']
  s.email       = ['andrey.radev@gmail.com']
  s.homepage    = 'http://github.com/AndrewRadev/randfiles'
  s.summary     = 'Select random files'
  s.description = <<-D
    Given a set of random directories, this scripts outputs the files in them
    in a random order. Combined with limitations by size or by number, this can
    be used to pick a random collection of files from the given directories.
  D

  s.add_development_dependency 'rspec', '>= 2.0.0'
  s.add_development_dependency 'rake'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'randfiles'

  s.files        = Dir['{lib}/**/*.rb', 'bin/*', 'LICENSE', '*.md']
  s.require_path = 'lib'
  s.executables  = ['randfiles']
end
