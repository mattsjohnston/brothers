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

require 'test_helper'

class GoalCompletionsControllerTest < ActionController::TestCase
  setup do
    @goal_completion = goal_completions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_completions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_completion" do
    assert_difference('GoalCompletion.count') do
      post :create, goal_completion: { goal_id: @goal_completion.goal_id, program_id: @goal_completion.program_id, user_id: @goal_completion.user_id }
    end

    assert_redirected_to goal_completion_path(assigns(:goal_completion))
  end

  test "should show goal_completion" do
    get :show, id: @goal_completion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_completion
    assert_response :success
  end

  test "should update goal_completion" do
    patch :update, id: @goal_completion, goal_completion: { goal_id: @goal_completion.goal_id, program_id: @goal_completion.program_id, user_id: @goal_completion.user_id }
    assert_redirected_to goal_completion_path(assigns(:goal_completion))
  end

  test "should destroy goal_completion" do
    assert_difference('GoalCompletion.count', -1) do
      delete :destroy, id: @goal_completion
    end

    assert_redirected_to goal_completions_path
  end
end
