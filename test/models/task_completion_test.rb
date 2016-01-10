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

class TaskCompletionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
