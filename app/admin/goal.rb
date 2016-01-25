ActiveAdmin.register Goal do
  permit_params :name, :description, :repeats, :interval, :interval_unit, :points, :group_id

  active_admin_import
end
