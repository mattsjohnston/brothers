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

class GoalCompletionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
