class TaskCompletionsController < InheritedResources::Base

  private

    def task_completion_params
      params.require(:task_completion).permit()
    end
end

