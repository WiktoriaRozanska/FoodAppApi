# frozen_string_literal: true

class EnablePqcryptoExtension < ActiveRecord::Migration[6.0]
  def change
    def change
      enable_extension 'pgcrypto'
    end
  end
end
