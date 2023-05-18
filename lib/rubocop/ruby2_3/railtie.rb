module Rubocop
  module Ruby23
    class Railtie < Rails::Railtie
      railtie_name :rubocop_ruby2_3

      if Rails.env.test? || Rails.env.development?
        rake_tasks do
          path = File.expand_path(__dir__)
          Dir.glob("#{path}/rakelib/**/*.rake").each { |f| load f }
        end
      end
    end
  end
end
