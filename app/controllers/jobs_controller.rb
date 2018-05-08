class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :authenticate_volunteer, only: [:volunteer, :volunteer_remove]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @volunteers = @job.users.with_role(:volunteer)
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.save
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def volunteer
    @job = Job.find(params[:job])
    unless @job.users.include?(current_user)
      @job.users << current_user
      @job.volunteers_needed -= 1
      @job.save
      redirect_to @job
    end
  end

  def volunteer_remove
    id =  request.url.chars.last

    @volunteer = User.find(params[:volunteer])
    @job = Job.find(params[:job])
    @job.users.delete(@volunteer)
    @job.volunteers_needed += 1
    @job.save
    redirect_to @job
  end

  def authenticate_volunteer
    redirect_to root_path, alert: 'You must be a volunteer to do this.' unless current_user.has_role?(:volunteer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :description, :street, :city, :country, :postcode, :volunteers_needed )
    end
end
