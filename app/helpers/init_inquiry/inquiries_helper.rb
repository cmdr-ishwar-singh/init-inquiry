module InitInquiry
  module InquiriesHelper

  	def resources_class
  		return Inquiry
  	end

  	def resources_inquiry
  		return :inquiry
  	end

    def resources_inquiry_obj
      return @inquiry
    end

  	def resources_inquiries
  		return :inquiries
  	end

    def resources_inquiries_obj
        return @inquiries
    end

    def resources_inquiries_path
      return inquiries_path
    end

    def resources_inquiry_path(resource)
      return inquiry_path(resource)
    end

    def resources_new_inquiry_path
      return new_inquiry_path
    end

  end
end
