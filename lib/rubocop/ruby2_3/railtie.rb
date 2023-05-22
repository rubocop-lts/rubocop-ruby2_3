module Rubocop
  module Ruby23
    class Railtie < Rails::Railtie
      railtie_name :rubocop_ruby2_3

      if Rails.env.test? || Rails.env.development?
        rake_tasks do
          Rubocop::Ruby23.install_tasks
        end
      end
    end
  end
end
