ActiveAdmin.register Post do
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

 # controller do
	#  def scoped_collection
	#  	Post.includes(:comments)
	#  end
 # end

permit_params :user_id, :title, :content

form do |f|
	inputs 'Agregar un nuevo Post' do
		f.input :user_id, 
						label: 'Author', 
						as: :select, 
						collection: User.pluck(:email, :id)
		input :title
		input :content
	end
	actions
end

index do
	column :id
	column :author do |post|
		post.user.email
	end
	column :title
	column :comments do |post|
		post.comments.count
	end
	actions
end

filter :created_at, as: :date_range

end
