class ElementPropertiesController < ApplicationController
  before_action :set_element_property, only: %i[ show edit update destroy ]

  # GET /element_properties or /element_properties.json
  def index
    @element_properties = ElementProperty.all
  end

  # GET /element_properties/1 or /element_properties/1.json
  def show
  end

  # GET /element_properties/new
  def new
    @element_property = ElementProperty.new
  end

  # GET /element_properties/1/edit
  def edit
  end

  # POST /element_properties or /element_properties.json
  def create
    @element_property = ElementProperty.new(element_property_params)

    respond_to do |format|
      if @element_property.save
        format.html { redirect_to element_property_url(@element_property), notice: "Element property was successfully created." }
        format.json { render :show, status: :created, location: @element_property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @element_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /element_properties/1 or /element_properties/1.json
  def update
    respond_to do |format|
      if @element_property.update(element_property_params)
        format.html { redirect_to element_property_url(@element_property), notice: "Element property was successfully updated." }
        format.json { render :show, status: :ok, location: @element_property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @element_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /element_properties/1 or /element_properties/1.json
  def destroy
    @element_property.destroy

    respond_to do |format|
      format.html { redirect_to element_properties_url, notice: "Element property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element_property
      @element_property = ElementProperty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def element_property_params
      params.require(:element_property).permit(:element_id, :name, :input_type, :value)
    end
end
