ActiveAdmin.register Guest do
  # Specify parameters which should be permitted for assignment
  permit_params :first_name, :last_name, :address, :phone, :email, :child, :dinner_presence, :brunch_presence, :food_restriction

  # or consider:
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :address, :phone, :email, :child, :dinner_presence, :brunch_presence, :food_restriction]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :first_name
  filter :last_name
  filter :address
  filter :email
  filter :child
  filter :dinner_presence, as: :select, collection: Guest.dinner_presences.keys
  filter :brunch_presence, as: :select, collection: Guest.brunch_presences.keys
  filter :food_restriction, as: :select, collection: Guest.food_restrictions.keys
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    # id_column
    column :first_name
    column :last_name
    column :address
    column :phone
    column :email
    column :child
    column :dinner_presence do |guest|
      span guest.dinner_presence, class: 'status-tag bg-red-200' if guest.dinner_presence == "dinner_no"
      span guest.dinner_presence, class: 'status-tag bg-green-200' if guest.dinner_presence == "dinner_yes"
      span guest.dinner_presence, class: 'status-tag' if guest.dinner_presence == "dinner_invited"
    end
    column :brunch_presence do |guest|
      span guest.brunch_presence, class: 'status-tag bg-red-200' if guest.brunch_presence == "brunch_no"
      span guest.brunch_presence, class: 'status-tag bg-green-200' if guest.brunch_presence == "brunch_yes"
      span guest.brunch_presence, class: 'status-tag' if guest.brunch_presence == "brunch_invited"
    end
    column :food_restriction
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      # row :id
      row :first_name
      row :last_name
      row :address
      row :phone
      row :email
      row :child
      row :dinner_presence do |guest|
        span guest.dinner_presence, class: 'status-tag bg-red-200' if guest.dinner_presence == "dinner_no"
        span guest.dinner_presence, class: 'status-tag bg-green-200' if guest.dinner_presence == "dinner_yes"
        span guest.dinner_presence, class: 'status-tag' if guest.dinner_presence == "dinner_invited"
      end
      row :brunch_presence do |guest|
        span guest.brunch_presence, class: 'status-tag bg-red-200' if guest.brunch_presence == "brunch_no"
        span guest.brunch_presence, class: 'status-tag bg-green-200' if guest.brunch_presence == "brunch_yes"
        span guest.brunch_presence, class: 'status-tag' if guest.brunch_presence == "brunch_invited"
      end
      row :food_restriction
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :address
      f.input :phone
      f.input :email
      f.input :child
      f.input :dinner_presence
      f.input :brunch_presence
      f.input :food_restriction
    end
    f.actions
  end
end
