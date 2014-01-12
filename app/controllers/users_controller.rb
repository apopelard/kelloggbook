class UsersController < ApplicationController
  before_action(:find_user, :only => [:show, :edit, :update, :destroy])
  before_action(:authorized_user, :only => [:index, :new])

  def authorized_user
    unless current_user.email == "apopelard2014@kellogg.northwestern.edu"
      redirect_to root_url, notice: "You are not allowed to view this page"
    end
  end

  def find_user
    if user_signed_in?  && current_user.email != "apopelard2014@kellogg.northwestern.edu"
      @user = current_user
    elsif user_signed_in?  && current_user.email == "apopelard2014@kellogg.northwestern.edu" && params[:id].nil?
      @user = current_user
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def index
    @users = User.all
  end

  def show
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
    @user.program_id = params[:program_id]
    @user.section_id = params[:section_id]
    @user.quote = params[:quote]
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
