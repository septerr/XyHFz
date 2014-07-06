ActiveAdmin.register Campaign do
  #menu ordering
  menu :priority => 2 #Campaigns will be second tab in the menu (first is dashboard tab)

  #Index
  index do
    column :name
    column :title
    column :goal
    column :end_date
    column :campaign_status
    default_actions
  end

  #Filters
  filter :campaign_status
  filter :name
  filter :title
  filter :end_date
  filter :goal


  #New/Edit
  form :html => {:enctype => 'multipart/form-data'} do |f|
    f.inputs "Campaign Basic Information" do
      f.input :name
      f.input :title
      f.input :goal, hint: 'Amount you want to raise'
      f.input :end_date, hint: 'Day the campaign ends even if the goal is not met'
      f.input :campaign_status, :include_blank => false
      f.input :video_embed_code, hint: 'Youtube or Vimeo embed code', :input_html => {:rows => 2}
      f.input :excerpt
      f.input :summary
    end

    f.inputs "Other" do
      f.input :show_in_carousel, hint: 'If checked, campaign will appear in the home page slider'
      image_hint = f.object.featured_image.file? ? f.template.image_tag(f.object.featured_image.url(:medium)) : ''
      dimensions_hint = 'Minimum required dimensions (3000 x 2000 px)' #todo include instructions about image dimensions
      f.input :featured_image, :as => :file, :required => true, :hint => image_hint
      f.input :categories, :include_blank => false, :input_html => {:style => "width: 700px;"}
    end
    f.actions
  end


  #Show
  show do |campaign|
    attributes_table do
      row :name
      row :title
      row :goal
      row :end_date
      row :campaign_status do
        image_tag(campaign.author_photo.url(:thumb))
      end
      row :featured_image do
        if campaign.featured_image
          image_tag(campaign.featured_image.url(:thumb))
        end
      end
      row 'Categories' do |category|
       campaign.categories.map(&:name).join('<br />').html_safe
      end
    end
    active_admin_comments
  end


end
