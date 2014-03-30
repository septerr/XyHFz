ActiveAdmin.register CampaignStatus do

  #menu ordering
  menu :priority => 3 #CampaignStatuses will be third tab in the menu

  form do |f|
    f.inputs do
      f.input :name
      f.input :crowd_reviewable
    end
    f.actions
  end
end
