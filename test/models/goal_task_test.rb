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

class GoalTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
