class OrganizationsController < ApplicationController
	before_action :set_organization, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user, only: [:new, :edit, :show, :index]
	before_action :admin_user, only: [:edit, :new, :destroy]
	def index
		@organizations = Organization.all
	end

	def show
	end

	def edit
	end

	def new 
		@organization = Organization.new
	end

	# POST organization/
	# POST /organization.json
	def create
		@organization = Organization.new(organization_params)

		respond_to do |format|
			if @organization.save
				flash[:success] = 'Organization was successfully created' 
				format.html { redirect_to @organization}
				format.json { render action: 'show', status: :created, location: @organization}
			else
				format.html { render action: 'new' }
				format.json { render json: @organization.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /organization/1
	# PATCH/PUT /organizations/1.json
	def update
		respond_to do |format|
			if @organization.update(organization_params)
				flash[:success] = "Organization was successfully updated" 
				format.html { redirect_to @organization}
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @organization.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /organization/1
	# DELETE /organization/1.json
	def destroy
		@other_id = Organization.where(:name => 'Other Institutes').first.id
		@organization.sw_interactions.update_all(:organization_id => @other_id)
		@organization.destroy
		respond_to do |format|
			format.html { redirect_to organizations_url}
			format.json { head :no_content }
		end
	end

	
	# Use callbacks to share common setup or constraints between actions.
	def set_organization
		@organization = Organization.find(params[:id])
		redirect_to organizations_url and flash[:danger] = "You cannot edit/delete this record" if @organization.name == "Other Institutes"
	end
	
	private
	def admin_user
		redirect_to(organizations_url) and flash[:danger] = "You have to be an admin to perform this action" unless current_user.admin?
	end

	def organization_params 
		params.require(:organization).permit(:name, :address, :phone)
	end
end
