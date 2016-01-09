class GoalTasksController < ApplicationController
  before_action :set_goal_task, only: [:show, :edit, :update, :destroy, :toggle]

  # GET /goal_tasks
  # GET /goal_tasks.json
  def index
    @goal_tasks = GoalTask.all
  end

  # GET /goal_tasks/1
  # GET /goal_tasks/1.json
  def show
  end

  # GET /goal_tasks/new
  def new
    @goal_task = GoalTask.new
  end

  # GET /goal_tasks/1/edit
  def edit
  end

  # POST /goal_tasks
  # POST /goal_tasks.json
  def create
    @goal_task = GoalTask.new(goal_task_params)

    respond_to do |format|
      if @goal_task.save
        format.html { redirect_to @goal_task, notice: 'Goal task was successfully created.' }
        format.json { render :show, status: :created, location: @goal_task }
      else
        format.html { render :new }
        format.json { render json: @goal_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_tasks/1
  # PATCH/PUT /goal_tasks/1.json
  def update
    respond_to do |format|
      if @goal_task.update(goal_task_params)
        format.html { redirect_to @goal_task, notice: 'Goal task was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_task }
      else
        format.html { render :edit }
        format.json { render json: @goal_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_tasks/1
  # DELETE /goal_tasks/1.json
  def destroy
    @goal_task.destroy
    respond_to do |format|
      format.html { redirect_to goal_tasks_url, notice: 'Goal task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
    TaskService.new(@goal_task).toggle current_user
    respond_to do |format|
      format.html { redirect_to group_url(@goal_task.group) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_task
      @goal_task = GoalTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_task_params
      params[:goal_task]
    end
end
