# frozen_string_literal: true

DEBUG = ENV.fetch("DEBUG", nil) == "true"

ruby_version = Gem::Version.new(RUBY_VERSION)
minimum_version = ->(version, engine = "ruby") { ruby_version >= Gem::Version.new(version) && RUBY_ENGINE == engine }
actual_version = lambda do |major, minor|
  actual = Gem::Version.new(ruby_version)
  major == actual.segments[0] && minor == actual.segments[1] && RUBY_ENGINE == "ruby"
end
debugging = minimum_version.call("2.7") && DEBUG
ALL_FORMATTERS = actual_version.call(2,
                                     7) && (ENV.fetch("COVER_ALL",
                                                      nil) || ENV.fetch("CI_CODECOV", nil) || ENV.fetch("CI", nil))

if DEBUG
  if debugging
    require "byebug"
  elsif minimum_version.call("2.7", "jruby")
    require "pry-debugger-jruby"
  end
end

# This gem
require "rubocop/ruby2_3"

# RSpec Configs
require "config/rspec/rspec_core"
