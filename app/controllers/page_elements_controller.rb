class PageElementsController < ApplicationController
  before_action :set_page
  before_action :set_element, only: %i[ new create edit update ]
  before_action :set_page_element, only: %i[ show edit update destroy ]

  # GET /page_elements or /page_elements.json
  def index
    @page_elements = PageElement.all
  end

  # GET /page_elements/1 or /page_elements/1.json
  def show
  end

  # GET /page_elements/new
  def new
    @page_element = @page.page_elements.new
    set_default_values
  end

  # GET /page_elements/1/edit
  def edit
  end

  # POST /page_elements or /page_elements.json
  def create
    @page_element = @page.page_elements.new(page_element_params)
    @page_element.element_id = @element.id

    respond_to do |format|
      if @page_element.save
        format.html { redirect_to edit_page_path(@page), notice: "Page element was successfully created." }
        format.json { render :show, status: :created, location: @page_element }
      else
        format.html { redirect_to edit_page_path(@page), status: :unprocessable_entity }
        format.json { render json: @page_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_elements/1 or /page_elements/1.json
  def update
    respond_to do |format|
      if @page_element.update(page_element_params)
        format.html { redirect_to edit_page_path(@page), notice: "Page element was successfully updated." }
        format.json { render :show, status: :ok, location: @page_element }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_elements/1 or /page_elements/1.json
  def destroy
    @page_element.destroy

    respond_to do |format|
      format.html { redirect_to edit_page_path(@page), notice: "Page element was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:page_id])
    end

    def set_element
      @element = Element.find_by(element_type: params[:element_type])
    end

    def set_page_element
      @page_element = PageElement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_element_params
      # params.require(:page_element).permit(:element_id, properties: {})
      params.require(:page_element).permit(:element_id, properties: set_properties)
    end

    def set_properties
      @element.element_properties.map do |property|
        property[:name].to_sym
      end
    end

    def set_default_values
      @page_element.properties = {}
      @element.element_properties.each do |property|
        @page_element.properties[property[:name]] = property[:value]
      end
    end
end
