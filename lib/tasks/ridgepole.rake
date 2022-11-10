# frozen_string_literal: true

# see https://qiita.com/lhside/items/0dcad79d9b801e34bc7c
namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    result = ridgepole('--apply', "-E #{Rails.env}", "--file #{schema_file}")
    # NOTE: 同じエラーだとslackに通知されないのでタイムスタンプを含めている
    raise "ridgepole fail #{Time.zone.now}" unless result

    Rake::Task['db:schema:dump'].invoke if need?
    Rake::Task['annotate_models'].invoke if need?
  end

  desc 'Export database schema'
  task export: :environment do
    ridgepole('--export', "-E #{Rails.env}", '--split', "--output #{schema_file}")
  end

  private

  def need?
    Rails.env.in?(%w[development])
  end

  private

  def ridgepole(*options)
    command = ['bundle exec ridgepole', "--config #{config_file}"]
    system [command + options].join(' ')
  end

  private

  def config_file
    Rails.root.join('config/database.yml')
  end

  private

  def schema_file
    Rails.root.join('db/schema/Schemafile')
  end
end
