# frozen_string_literal: true

module Byebug
  class << self
    def start_remote_debugging
      require 'byebug/core'
      require 'byebug'
      self.wait_connection = true
      start_server('localhost', ENV['BYEBUG_PORT'] || 8989) do
        Rails.logger.warn "Remote Byebug debugger waiting on port #{Byebug.actual_port}"
      end
      attach
    end
  end
end
