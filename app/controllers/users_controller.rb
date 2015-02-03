class UsersController < ApplicationController
    before_filter :check_session!, :only => [:me, :edit, :update]
    
  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def create
	@user = User.new(params[:user])
	respond_to do |format|
      	
        if @user.save
            sign_in @user
            redirect_to :action => 'me' and return
        else
            format.html { render action: 'new' }
        end
  	end
  end

  def me
	@user = User.find(current_user)
  end

  def edit
     @user = User.find(current_user) 
  end
    
  def update
      ##@user = User.new(params[:user])
    if User.update(params[:id],params[:user])
        #User.update @user.id, params[:user]
        redirect_to :action => 'me'
    else
        render action: 'edit'
    end
  end      

end
