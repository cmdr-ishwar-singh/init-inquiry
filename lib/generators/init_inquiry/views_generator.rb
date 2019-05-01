# frozen_string_literal: true

require 'rails/generators/base'

module InitInquiry
  module Generators
    # Include this module in your generator to generate Inquiry views.
    # `copy_views` is the main method and by default copies all views
    # with forms.

    module ViewPathTemplates extend ActiveSupport::Concern 
    	included do
    		argument :scope, required: false,default: "inquiry",
           desc: "The scope to copy views to"
            public_task :copy_views
        end

      def copy_views
          view_directory :inquiries
	    end

	    protected
      
      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}" do |content|
          if scope
            content
          end
        end
	    end

      # target path for your application             
  		def target_path
    		@target_path ||= "app/views/#{plural_scope || "inquiries"}"
  		end

     	def plural_scope
      	  @plural_scope ||= scope.presence && scope.underscore.pluralize
      end

      def singular_scope
        @singular_scope ||= scope.presence && scope.underscore.singularize
      end

    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      	source_root File.expand_path("../../../../app/views/init_inquiry", __FILE__)

        def create_helper_file
          create_file "app/helpers/#{plural_scope}_helper.rb", <<-FILE
module #{plural_scope.capitalize}Helper

    def resources_class
      return #{singular_scope.capitalize}
    end

    def resources_inquiry
      return :#{singular_scope}
    end

    def resources_inquiry_obj
      return @#{singular_scope}
    end

    def resources_inquiries
      return :#{plural_scope}
    end

    def resources_inquiries_obj
        return @#{plural_scope}
    end

    def resources_inquiries_path
      return #{plural_scope}_path
    end

    def resources_inquiry_path(resource)
      return #{singular_scope}_path(resource)
    end

    def resources_new_inquiry_path
      return new_#{singular_scope}_path
    end

end
    FILE
        end
        
     	  desc "Copies default Inquiry views to your application."
        hide!
    end

    class ViewsGenerator < Rails::Generators::Base
    	argument :scope, required: false, default: "inquiry",
                         desc: "The scope to copy views to"
      invoke FormForGenerator
      	
  	end
  end
end