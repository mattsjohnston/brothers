# == Schema Information
#
# Table name: goal_completions
#
#  id         :integer          not null, primary key
#  goal_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  group_id   :integer
#

class GoalCompletionsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_goal_completion, only: [:show, :edit, :update, :destroy]

  # GET /goal_completions
  # GET /goal_completions.json
  def index
    @goal_completions = GoalCompletion.all
  end

  # GET /goal_completions/1
  # GET /goal_completions/1.json
  def show
  end

  # GET /goal_completions/new
  def new
    @goal_completion = GoalCompletion.new
  end

  # GET /goal_completions/1/edit
  def edit
  end

  # POST /goal_completions
  # POST /goal_completions.json
  def create
    @goal_completion = GoalCompletion.new(goal_completion_params)
    @goal_completion.user = current_user

    respond_to do |format|
      if @goal_completion.save
        format.html { redirect_to @goal_completion, notice: 'Goal completion was successfully created.' }
        format.json { render :show, status: :created, location: @goal_completion }
      else
        format.html { render :new }
        format.json { render json: @goal_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_completions/1
  # PATCH/PUT /goal_completions/1.json
  def update
    respond_to do |format|
      if @goal_completion.update(goal_completion_params)
        format.html { redirect_to @goal_completion, notice: 'Goal completion was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_completion }
      else
        format.html { render :edit }
        format.json { render json: @goal_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_completions/1
  # DELETE /goal_completions/1.json
  def destroy
    @goal_completion.destroy
    respond_to do |format|
      format.html { redirect_to goal_completions_url, notice: 'Goal completion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_completion
      @goal_completion = GoalCompletion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_completion_params
      params.require(:goal_completion).permit(:goal_id, :user_id, :program_id)
    end
end
