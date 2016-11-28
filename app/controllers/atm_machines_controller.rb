class AtmMachinesController < ApplicationController
 before_action :set_atm_machine, only: [:show, :edit, :update, :destroy]
 skip_before_filter :authenticate_user!, :only => :index

 # GET /atm_machines
 # GET /atm_machines.json
  def index
  if params[:search].present?
    @atm_machines = AtmMachine.near(params[:search], 50)
  else
    @atm_machines = AtmMachine.all
  end
  end

 # GET /atm_machines/1
 # GET /atm_machines/1.json
 def show
   @user = User.find(current_user)
   @atm_machine=AtmMachine.find(params[:id])
   session[:my_atm_machine]= @atm_machine.id
 end

 # GET /atm_machines/new
 def new
   @atm_machine = AtmMachine.new
 end

 # GET /atm_machines/1/edit
 def edit
 end

 # POST /atm_machines
 # POST /atm_machines.json
 def create
   @atm_machine = AtmMachine.new(atm_machine_params)

   respond_to do |format|
     if @atm_machine.save
       format.html { redirect_to @atm_machine, notice: 'Atm machine was successfully created.' }
       format.json { render :show, status: :created, location: @atm_machine }
     else
       format.html { render :new }
       format.json { render json: @atm_machine.errors, status: :unprocessable_entity }
     end
   end
 end

 # PATCH/PUT /atm_machines/1
 # PATCH/PUT /atm_machines/1.json
 def update
   respond_to do |format|
     if @atm_machine.update(atm_machine_params)
       format.html { redirect_to @atm_machine, notice: 'Atm machine was successfully updated.' }
       format.json { render :show, status: :ok, location: @atm_machine }
     else
       format.html { render :edit }
       format.json { render json: @atm_machine.errors, status: :unprocessable_entity }
     end
   end
 end

 # DELETE /atm_machines/1
 # DELETE /atm_machines/1.json
 def destroy
   @atm_machine.destroy
   respond_to do |format|
     format.html { redirect_to atm_machines_url, notice: 'Atm machine was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 private
   # Use callbacks to share common setup or constraints between actions.
   def set_atm_machine
     @atm_machine = AtmMachine.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def atm_machine_params
     params.require(:atm_machine).permit(:address, :latitude, :longitude)
   end
end