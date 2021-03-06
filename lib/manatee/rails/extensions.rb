module ActionDispatch::Journey
  module Nodes
    class Node
      def compile_hash
        Manatee::Rails::HashVisitor.new.accept self
      end
    end
  end
end

# This is required to Rails for using app directory
module Manatee
  class Engine < ::Rails::Engine
  end

  # This method must be used to hook Manatee into Rails
  def self.subscribe_on_rails
    ActionView::Base.send :include, Manatee::Rails::Helper
    ActionController::Base.prepend_view_path Manatee::Rails::Resolver.new(Manatee.views_asset)
    ActionView::Template.register_template_handler :'jst', Manatee::Rails::Handler.instance
    Manatee::Sprockets::JshProcessor.subscribe ::Rails.application.assets
  end
end
