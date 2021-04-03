# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'autocomplete_zipcode'
require 'simple_form'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("dummy/config/environment.rb", __dir__)

require 'spec_helper'
require 'bundler/setup'
require 'pry'

Bundler.setup

Dir[Rails.root.join("../../app/inputs/**/*.rb")].sort.each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end