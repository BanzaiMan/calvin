require "bundler/setup"
require "simplecov"

SimpleCov.start do
  add_filter '/test/'
  add_filter '/features/'
  add_filter '/spec/'
  add_filter '/autotest/'

  add_group 'Binaries', '/bin/'
  add_group 'Libraries', 'lib/'
  add_group 'Extensions', '/ext/'
  add_group 'Vendor Libraries', '/vendor/'
end

require "calvin"

RSpec.configure do |config|
  include Calvin::Helpers
end
