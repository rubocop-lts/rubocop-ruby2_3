# frozen_string_literal: true

require "anonymous_loader"
require "rubocop/ruby2_3"
RSpec.describe Rubocop::Ruby23::Version do
  it_behaves_like "a Version module", described_class

  it "executes the version file for coverage without redefining constants" do
    paths = [
      File.expand_path("../../../lib/rubocop/ruby2_3/version.rb", __dir__),
      File.expand_path("../../../lib/rubocop/ruby2_3/version_gem.rb", __dir__)
    ].select { |path| File.file?(path) }
    anonymous_namespace = AnonymousLoader.load(files: paths)

    expect(anonymous_namespace::Rubocop::Ruby23::Version::VERSION).to eq(described_class::VERSION)
  end
end
