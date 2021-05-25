ActiveAdmin.register Saddle do
  permit_params :color
  active_admin_import validate: true,
                      before_batch_import: proc { |import|
                        if import.headers.key?('amount')
                          self.class.include ImportWithAmount
                          duplicate_values_by_amount(import)
                        end
                      },
                      back: { action: :index }

  index do
    selectable_column
    id_column
    column :color
    actions
  end

  filter :color

  form do |f|
    f.inputs do
      f.input :color
    end
    f.actions
  end
end
