class VisitsController < ApplicationController
  before_action :set_visit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]



  # GET /visits or /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1 or /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    if current_user.email == "admin@szpital"
      @visit = Visit.new
    else
      @visit = current_user.visits.build
    end
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits or /visits.json
  def create
    #@visit = Visit.new(visit_params)
    if current_user.email == "admin@szpital"
      @visit = Visit.new(visit_params)
    else
      @visit = current_user.visits.build(visit_params)
    end
    respond_to do |format|
      if @visit.save
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully created." }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1 or /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully updated." }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1 or /visits/1.json
  def destroy
    @visit.destroy!

    respond_to do |format|
      format.html { redirect_to visits_url, notice: "Visit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    puts "dzial"
    if current_user.email == "admin@szpital"
      puts "dzial"
      @visits = Visit.all
    else
      @visit = current_user.visits.find_by(id: params[:id])
      redirect_to visits_path, notice: "Not Authorized To Edit This Visit" if @visit.nil?
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:topic, :patient, :doctor, :begining, :ending, :user_id)
    end
end
