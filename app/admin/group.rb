ActiveAdmin.register Group do
  permit_params :name, :aasm_state, :starts_at, :total_days, :description

  action_item only: :show do
    link_to 'Start', start_admin_group_path(group) if group.paused?
  end

  action_item only: :show do
    link_to 'Pause', pause_admin_group_path(group) if group.active?
  end

  action_item only: :show do
    link_to 'Reset', reset_admin_group_path(group) if group.active?
  end


  member_action :start do
    group = Group.find(params[:id])
    group.start!
    
    redirect_to action: :show, notice: 'Goal has been started.'
  end

  member_action :pause do
    group = Group.find(params[:id])
    group.pause!
    
    redirect_to action: :show, notice: 'Goal has been started.'
  end

  member_action :reset do
    group = Group.find(params[:id])
    ggs = GroupGoalsService.new group
    ggs.reset_tasks
    
    redirect_to action: :show, notice: 'Goal tasks have been reset.'
  end

  
  active_admin_import

end
