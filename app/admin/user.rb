ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :image, :role

  # Customize edit form
  form do |f|
    f.inputs "User details" do
      f.input :name
      f.input :email
      f.input :role
      f.input :image

      f.actions
    end
  end

end
