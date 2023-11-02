# frozen_string_literal: true

require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class Button < Administrate::Field::Base
      class Engine < ::Rails::Engine; end

      def confirm?
        options.fetch(:confirm, false)
      end
    end
  end
end
