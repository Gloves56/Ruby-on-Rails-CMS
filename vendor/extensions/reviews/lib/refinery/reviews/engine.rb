module Refinery
  module Reviews
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Reviews

      engine_name :refinery_reviews

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "reviews"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.reviews_admin_reviews_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Reviews)
      end
    end
  end
end
