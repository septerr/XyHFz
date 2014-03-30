ActiveAdmin.register Category do
  #menu ordering
  menu :priority => 4 #Categories will be fourth tab in the menu

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
