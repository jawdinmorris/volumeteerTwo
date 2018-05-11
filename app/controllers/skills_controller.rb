class SkillsController < ApplicationController
  before_action :authenticate_user!
  def index
    @skills = current_user.skills.all
    @user = current_user
  end

  def new
    @user = current_user
    @skill = Skill.new
  end

  def create
    @user = current_user
    @skill = current_user.skills.new(skill_params)
    @skill.save
    @skill.users << current_user
    @skill.save
    redirect_to action: :index
  end

  def destroy
    @skill = current_user.skills.find(params[:id])
    @skill.destroy
    redirect_to action: :index
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end
