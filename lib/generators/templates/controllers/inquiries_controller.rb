
class <%= plural_scope.capitalize %>Controller < ApplicationController
  before_action :set_<%= prefix_scope.downcase %>, only: [:show, :edit, :update, :destroy]

  def index
    @<%= plural_scope %> = <%= prefix_scope %>.all
  end

  def show
    respond_to do |format|
        format.js
      end
  end

  def new
    @<%= prefix_scope.downcase %> = <%= prefix_scope %>.new
  end

  def edit
  end

  def create
    @<%= prefix_scope.downcase %> = <%= prefix_scope %>.new(<%= prefix_scope.downcase %>_params)

    if @<%= prefix_scope.downcase %>.save
      redirect_to <%= plural_scope %>_path, notice: '<%= prefix_scope %> was successfully created.'
    else
      render :new
    end
  end

  def update
    @inq = <%= prefix_scope %>.find(params[:id])
      if @inq.update(:status => 0)
         flash[:success] = '<%= prefix_scope %> has been Completed.'
      end
      redirect_to <%= plural_scope %>_path

  end

  def destroy
    @<%= prefix_scope.downcase %>.destroy
    redirect_to <%= plural_scope %>_url, notice: '<%= prefix_scope %> was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= prefix_scope.downcase %>
      @<%= prefix_scope.downcase %> = <%= prefix_scope %>.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def <%= prefix_scope.downcase %>_params
      params.require(:<%= prefix_scope.downcase %>).permit(:name, :phone, :description, :email)
    end
end
