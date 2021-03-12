# frozen_string_literal: true

require "./config/env"

dev = ENV["RACK_ENV"] == "development"

if dev
  require "logger"
  logger = Logger.new($stdout)
end

require "rack/unreloader"
Unreloader = Rack::Unreloader.new(subclasses: %w[Roda Sequel::Model],
                                  logger: logger,
                                  reload: dev) { StrumStructApp }

Unreloader.require("config/app.rb") { "StrumStructApp" }
run(dev ? Unreloader : StrumStructApp.freeze.app)
