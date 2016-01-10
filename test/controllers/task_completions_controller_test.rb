# == Schema Information
#
# Table name: task_completions
#
#  id           :integer          not null, primary key
#  goal_task_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  group_id     :integer
#

require 'test_helper'

class TaskCompletionsControllerTest < ActionController::TestCase
  setup do
    @task_completion = task_completions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_completions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_completion" do
    assert_difference('TaskCompletion.count') do
      post :create, task_completion: {  }
    end

    assert_redirected_to task_completion_path(assigns(:task_completion))
  end

  test "should show task_completion" do
    get :show, id: @task_completion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_completion
    assert_response :success
  end

  test "should update task_completion" do
    patch :update, id: @task_completion, task_completion: {  }
    assert_redirected_to task_completion_path(assigns(:task_completion))
  end

  test "should destroy task_completion" do
    assert_difference('TaskCompletion.count', -1) do
      delete :destroy, id: @task_completion
    end

    assert_redirected_to task_completions_path
  end
end
