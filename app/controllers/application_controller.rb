# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_cors_headers

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = cors_allow_origin
    headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def cors_allow_origin
    # 設定されていない場合はエラーにする
    ENV.fetch('CORS_ALLOW_ORIGIN')
  end
end
