ActiveAdmin.register Group do
  permit_params :name, :aasm_state, :starts_at, :ends_at

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  action_item only: :show do
    link_to 'Start', start_admin_group_path(group) if group.paused?
  end

  action_item only: :show do
    link_to 'Pause', pause_admin_group_path(group) if group.active?
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

end
