class UsersController < ApplicationController
  before_action(:find_user, :only => [:show, :edit, :update, :destroy])
  before_action(:authorized_user, :only => [:index, :new])

  def authorized_user
    unless current_user.right >= 2
      redirect_to root_url, notice: "You are not allowed to view this page"
    end
  end

  def find_user
    if user_signed_in?  && current_user.right != 3
      @user = current_user
    elsif user_signed_in?  && current_user.right == 3 && params[:id].nil?
      @user = current_user
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        if params[:agree] == "1"
          render :json => User.where(:agreement => true)
        elsif params[:agree] == "0"
          render :json => User.where(:agreement => false)
        else
          render :json => User.all
        end
      end
    end
  end

  def show
    if current_user.sign_in_count == 1 && current_user.registered == false
      UserMailer.registration_confirmation(current_user).deliver
      current_user.registered = true
      current_user.save
    end
  end

  def new
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.program_id = params[:program_id]
    @user.section_id = params[:section_id]
    @user.quote = params[:quote]
    @user.agreement = params[:agreement]

    if @user.save
      redirect_to users_url, notice: "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @programs = Program.all
    @sections = Section.all
    if @user.program.present?
      @current_program = @user.program.id
    end
    if @user.section.present?
      @current_section = @user.section.id
    end

  end

  def update
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.jv_first_name = params[:jv_first_name]
    @user.jv_last_name = params[:jv_last_name]
    @user.program_id = params[:program_id]
    @user.section_id = params[:section_id]
    @user.kwest_attended = params[:kwest_attended]
    @user.kwest_led = params[:kwest_led]
    @user.quote = params[:quote]
    if @user.agreement == false && params[:agreement] == "true"
      UserMailer.agreement_confirmation(@user).deliver
    end
    if params[:jv_presence] == "true"
      @user.jv_presence = params[:agreement]
    else
      @user.jv_presence = false
    end
    if params[:agreement] == "true"
      @user.agreement = params[:agreement]
    else
      @user.agreement = false
    end

    if @user.save
      redirect_to user_url(@user.id), notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end
end
