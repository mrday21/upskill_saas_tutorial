class ProfilesController < ApplicationController
  
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out the form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
     if @profile.save
       flash[:sucess] = "Profile Updated!"
       redirect_to user_path( params[:user_id] )
     else
       #If form fails to save send back to new form field
       render action: :new
     end
  end
  
  #Whitelisting
  private
  def profile_params
    params.require(:profile).permit(:first_name, :job_title, :phone_number, 
    :contact_email, :description)
  end
end