# frozen_string_literal: true

# external libs
require "version_gem"

# this gem
require_relative "ruby2_3/version"
# :nocov:
require_relative "ruby2_3/railtie" if defined?(Rails::Railtie)
# :nocov:

module Rubocop
  # Namespace of this library
  module Ruby23
    module_function def install_tasks
      load "rubocop/ruby2_3/tasks.rake"
    end
  end
end

Rubocop::Ruby23::Version.class_eval do
  extend VersionGem::Basic
end
