# == Schema Information
#
# Table name: goal_tasks
#
#  id          :integer          not null, primary key
#  goal_id     :integer
#  group_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  due_date    :datetime
#  description :string(255)
#

require 'test_helper'

class GoalTasksControllerTest < ActionController::TestCase
  setup do
    @goal_task = goal_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_task" do
    assert_difference('GoalTask.count') do
      post :create, goal_task: { goal_id: @goal_task.goal_id, group_id: @goal_task.group_id }
    end

    assert_redirected_to goal_task_path(assigns(:goal_task))
  end

  test "should show goal_task" do
    get :show, id: @goal_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_task
    assert_response :success
  end

  test "should update goal_task" do
    patch :update, id: @goal_task, goal_task: { goal_id: @goal_task.goal_id, group_id: @goal_task.group_id }
    assert_redirected_to goal_task_path(assigns(:goal_task))
  end

  test "should destroy goal_task" do
    assert_difference('GoalTask.count', -1) do
      delete :destroy, id: @goal_task
    end

    assert_redirected_to goal_tasks_path
  end
end
