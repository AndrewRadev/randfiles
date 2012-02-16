require File.expand_path('../lib/random_files/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'random_files'
  s.version     = RandomFiles::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrew Radev']
  s.email       = ['andrey.radev@gmail.com']
  s.homepage    = 'http://github.com/AndrewRadev/random_files'
  s.summary     = 'TODO'
  s.description = <<-D
    TODO
  D

  s.add_development_dependency 'rspec', '>= 2.0.0'
  s.add_development_dependency 'rake'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'random_files'

  s.files        = Dir['{lib}/**/*.rb', 'bin/*', 'LICENSE', '*.md']
  s.require_path = 'lib'
  s.executables  = ['random_files']
end
