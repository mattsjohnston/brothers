# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  repeats       :boolean
#  interval      :integer
#  interval_unit :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  group_id      :integer
#

require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @goal = goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post :create, goal: { description: @goal.description, interval: @goal.interval, interval_unit: @goal.interval_unit, name: @goal.name, repeats: @goal.repeats }
    end

    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should show goal" do
    get :show, id: @goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    patch :update, id: @goal, goal: { description: @goal.description, interval: @goal.interval, interval_unit: @goal.interval_unit, name: @goal.name, repeats: @goal.repeats }
    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal
    end

    assert_redirected_to goals_path
  end
end
