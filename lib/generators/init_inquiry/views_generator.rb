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

    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      	# source_root File.expand_path("../../../../app/views/init_inquiry", __FILE__)
        source_root File.expand_path("../../templates/views", __FILE__)

        
     	  desc "Copies default Inquiry views to your application."
        hide!
    end

    class ViewsGenerator < Rails::Generators::Base
    	argument :scope, required: false, default: "inquiry",
                         desc: "The scope to copy views to"
      invoke FormForGenerator
      


      protected
       
      def singular_scope
        @singular_scope ||= scope.presence && scope.underscore.singularize
      end
    	
  	end
  end
end