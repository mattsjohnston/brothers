ActiveAdmin.register GoalTask do
  permit_params :due_date

  index do
    selectable_column
    column :id
    column :name
    column :due_date
    actions
  end

  controller do
    def scoped_collection
      resource_class.includes(:goal)
    end
  end
end
