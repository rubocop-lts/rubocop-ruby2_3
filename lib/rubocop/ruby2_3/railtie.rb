module Rubocop
  module Ruby23
    class Railtie < Rails::Railtie
      railtie_name :rubocop_ruby2_3

      rake_tasks do
        load "rubocop/ruby2_3/tasks.rake" if Rails.env.test? || Rails.env.development?
      end
    end
  end
end
