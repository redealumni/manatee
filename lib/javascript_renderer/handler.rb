require 'singleton'

module JavascriptRenderer
  class Handler
    include Singleton

    def eval_template(identifier, params = {})
      context.call javascript_template_code(identifier, params), params
    end

    def eval(javascript_code)
      context.eval javascript_code
    end

    def context
      check_context
      @context
    end

    def reset!
      @context = nil
    end

    protected
    def javascript_template_code(identifier, params)
      token = params[:csrf_token] ? params[:csrf_token].inspect : false
      "(function(){ this.csrfToken = #{token}; return this[#{ identifier.inspect }]; }).call(#{JavascriptRenderer.renderer_namespace})"
    end

    def check_context
      load_context if !instance_variable_get(:@context) || @last_mtime != views_asset.mtime
    end

    def load_context
      asset       = views_asset
      @last_mtime = asset.mtime
      @context    = ExecJS.compile asset.source
    end

    def views_asset
      JavascriptRenderer.assets[ JavascriptRenderer.views_asset ]
    end

  end
end
