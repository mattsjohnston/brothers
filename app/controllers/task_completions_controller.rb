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

class TaskCompletionsController < InheritedResources::Base

  private

    def task_completion_params
      params.require(:task_completion).permit()
    end
end

