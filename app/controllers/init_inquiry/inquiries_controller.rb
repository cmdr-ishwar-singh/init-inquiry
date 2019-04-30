require_dependency "init_inquiry/application_controller"

module InitInquiry
  class InquiriesController < ApplicationController
    before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

    # GET /inquiries
    def index
      @inquiries = Inquiry.all.order(id: 'desc')
    end

    # GET /inquiries/1
    def show
      respond_to do |format|
        format.js
      end
    end

    # GET /inquiries/new
    def new
      @inquiry = Inquiry.new
    end

    # GET /inquiries/1/edit
    def edit
    end

    # POST /inquiries
    def create
      @inquiry = Inquiry.new(inquiry_params)

      if @inquiry.save
        redirect_to inquiries_path, notice: 'Inquiry was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /inquiries/1
    def update
      @inq = Inquiry.find(params[:id])
      if @inq.update(:status => 0)
         flash[:success] = 'Inquiry has been Completed.'
      end
      redirect_to inquiries_path
    end

    # DELETE /inquiries/1
    def destroy
      @inquiry.destroy
      redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_inquiry
        @inquiry = Inquiry.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def inquiry_params
        params.require(:inquiry).permit(:name, :description, :phone, :email, :status)
      end
  end
end
