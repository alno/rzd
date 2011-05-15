require File.expand_path("../lib/rzd/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "rzd"
  s.version = Rzd::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ["Alexey Noskov"]
  s.email = ["alexey.noskov@gmail.com"]
  s.homepage = "http://github.com/alno/rzd"
  s.summary = "Rzd is a gem automating checking ticket information for russian railway service rzd.ru."
  s.description = "Rzd is a gem automating checking ticket information for russian railway service rzd.ru. Now it allows to get available ticket types fro given cities and date."

  s.required_rubygems_version = ">= 1.3.6"

  # Gem dependencies
  s.add_dependency "mechanize"

  # Gem files
  s.files = Dir["lib/**/*.rb", "bin/*", "MIT-LICENSE", "README.rdoc"]
  s.extra_rdoc_files = [ "README.rdoc", "MIT-LICENSE"]
  s.require_path = 'lib'
  s.executables = ["rzd"]

  # Info
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rzd gem", "--main", "README.rdoc"]

end
