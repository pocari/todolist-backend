# frozen_string_literal: true

class PreFlightController < ::ApplicationController
  # ブラウザからのPreFlightを処理する。
  def handle_pre_flight
    headers['Access-Control-Allow-Origin'] = cors_allow_origin
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Allow-Methods'] = %w[GET POST PUT PATCH DELETE OPTIONS HEAD].join(',')
    headers['Access-Control-Allow-Headers'] = %w[Content-Type X-CSRF-TOKEN].join(',')
    headers['Access-Control-Max-Age'] = 86_400

    head :ok
  end
end
