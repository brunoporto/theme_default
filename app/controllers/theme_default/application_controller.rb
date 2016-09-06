module ThemeDefault
  module ApplicationController
    extend ActiveSupport::Concern
    included do
      after_filter :prepare_unobtrusive_flash
    end
  end
end