# frozen_string_literal: true

require 'rails/generators/named_base'

module InitInquiry
  module Generators
    class InitInquiryGenerator < Rails::Generators::NamedBase

      namespace "init_inquiry"

      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_initializer
        template "inquiry.rb", "#{target_path}/#{singular_name}.rb"
      end

      hook_for :orm

      def add_devise_routes
        route "resources :#{plural_name}".dup
        route "get '/#{plural_name}/:id/update' , to: '#{plural_name}#update' , as: '#{plural_name}_update'".dup
      end

      protected
      # target path for your application
      def target_path
        @target_path ||= "app/models/"
      end

    end
  end
end