# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  aasm_state  :string(255)
#  starts_at   :datetime
#  total_days  :integer
#  description :text
#

class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :join, :leave]
  before_filter :authenticate_user!

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @display_date = params.has_key?(:display_date) ? Date.parse(params[:display_date]) : Date.today
    @group_date_service = GroupDateService.new @group, @display_date
    @other_members = @group.users.where.not(id: current_user.id)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @group.start!
    respond_to do |format|
      format.html { redirect_to group_url(group), notice: "Group plan has been started." }
      format.json { head :no_content }
    end
  end

  def join
    @group.add_user(current_user)
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "You've joined the group." }
      format.json { head :no_content }
    end
  end

  def leave
    @group.remove_user(current_user)
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "You've been removed from the group." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end
end
