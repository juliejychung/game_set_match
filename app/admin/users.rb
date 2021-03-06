ActiveAdmin.register User do
  permit_params :first_name, :last_name, :state, :city, :neighborhood, :email,
                :password, :level, :gender, :age, :profile_picture, :coach, :cost_per_hour

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
