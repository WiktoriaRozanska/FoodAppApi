# frozen_string_literal: true

class V1Controller < ApplicationController
  include ExceptionHandler

  # before_action :authenticate_user!

  def current_user
    @current_user ||= super
  end
end
