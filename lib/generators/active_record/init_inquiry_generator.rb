# frozen_string_literal: true

require 'rails/generators/active_record'
require 'generators/init_inquiry/orm_helpers'

module ActiveRecord
	module Generators
	  class InitInquiryGenerator < ActiveRecord::Generators::Base

	    include InitInquiry::Generators::OrmHelpers
		    	
	    source_root File.expand_path("../templates", __FILE__)

	    def copy_devise_migration
	        migration_template "migration.rb", "#{migration_path}/create_#{table_name}.rb", migration_version: migration_version
	    end

		def generate_model
        	invoke "active_record:model", [name], migration: false unless model_exists? && behavior == :invoke
      	end  

      def migration_data
<<RUBY
t.string :name
      t.string :description
      t.string :phone
      t.string :email
      t.integer :status ,default: 1

RUBY
      end

	  end

	end
end