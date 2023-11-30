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

      def branch_options
        values = options.fetch(:branch, true)

        if values.respond_to? :call
          values = values.arity.positive? ? values.call(self) : values.call
        end

        values
      end
    end
  end
end
