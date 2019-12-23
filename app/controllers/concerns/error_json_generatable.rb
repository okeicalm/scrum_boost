# frozen_string_literal: true

module ErrorJsonGeneratable
  include ActiveSupport::Concern

  private

  def error_json(messages:)
    { error_message: messages.join("\n") }.to_json
  end
end
