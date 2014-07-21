require File.expand_path('../lib/sql-gui/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sql-gui'
  s.version     = SqlGui::VERSION
  s.authors     = ['Yorick Peterse']
  s.email       = 'yorickpeterse@gmail.com'
  s.summary     = 'A SQL GUI for PostgreSQL, MySQL and SQLite3'
  s.homepage    = 'https://github.com/yorickpeterse/sql-gui/'
  s.description = s.summary
  s.executables = ['sql-gui']
  s.license     = 'MIT'

  s.files = Dir.glob([
    'checksum/**/*',
    'doc/**/*',
    'lib/**/*.rb',
    'README.md',
    'LICENSE',
    'sql-gui.gemspec',
    '.yardopts'
  ]).select { |path| File.file?(path) }

  s.has_rdoc              = 'yard'
  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'gir_ffi-gtk'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', ['~> 3.0']
  s.add_development_dependency 'yard'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'kramdown'
end
