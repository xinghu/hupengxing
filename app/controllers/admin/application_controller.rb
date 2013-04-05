class Admin::ApplicationController < ApplicationController

  layout 'admin'

  before_filter "http_auth"

   # 管理员身份验证，临时性解决方案
  def http_auth
    authenticate_or_request_with_http_basic(request.domain) do |username, password|
      username == 'admin' && password == 'hupengxing123'
    end
  end
end
