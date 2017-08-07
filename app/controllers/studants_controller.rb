class StudantsController < ApplicationController
  before_action :set_studant, only: [:edit, :update, :destroy]
  before_action :set_classes, only: [:edit, :new, :create, :update]

  # GET /studants
  # GET /studants.json
  def index
    @studants = Studant.order(created_at: :desc)
  end

  # GET /studants/new
  def new
    @studant = Studant.new
  end

  # GET /studants/1/edit
  def edit
  end

  # POST /studants
  # POST /studants.json
  def create
    @studant = Studant.new(studant_params)

    respond_to do |format|
      if @studant.save
        format.html { redirect_to studants_path, notice: 'Studant was successfully created.' }
        format.json { render :show, status: :created, location: @studant }
      else
        format.html { render :new }
        format.json { render json: @studant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studants/1
  # PATCH/PUT /studants/1.json
  def update
    respond_to do |format|
      if @studant.update(studant_params)
        format.html { redirect_to studants_path, notice: 'Studant was successfully updated.' }
        format.json { render :show, status: :ok, location: @studant }
      else
        format.html { render :edit }
        format.json { render json: @studant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studants/1
  # DELETE /studants/1.json
  def destroy
    @studant.destroy
    respond_to do |format|
      format.html { redirect_to studants_url, notice: 'Studant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studant
      @studant = Studant.find(params[:id])
    end

    def set_classes
      @classes = SchoolClass.all.map {|c| [c.full_name, c.id]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studant_params
      params.require(:studant).permit(:name, :birthday, :school_class_id, responsible_ids: [])
    end
end
