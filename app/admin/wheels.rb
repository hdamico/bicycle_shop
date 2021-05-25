ActiveAdmin.register Wheel do
  permit_params :size
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
    column :size
    actions
  end

  filter :size

  form do |f|
    f.inputs do
      f.input :size
    end
    f.actions
  end
end
