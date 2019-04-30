# frozen_string_literal: true

require 'rails/generators/base'

module InitInquiry
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      puts "================== InstallGenerator ==============="

      # def copy_initializer
      #   template "inquiry.rb", "config/initializers/inquiry.rb"
      # end

      # def copy_locale
      #   copy_file "../../../config/locales/en.yml", "config/locales/inquiry.en.yml"
      # end

    end
  end
end

