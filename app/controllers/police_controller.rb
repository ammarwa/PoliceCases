class PoliceController < ApplicationController
  before_action :set_police, only: [:show, :edit, :update, :destroy]

  # GET /police
  # GET /police.json
  def index
    if session[:police_id] != nil
      if session[:cas] == nil
        if session[:casl] == nil
          @police = Police.all
          @cases = Report.all
        else
          @police = Police.all
          @cases = Report.order(:x, :y)
        end
      else
        @police = Police.all
        @cases = Report.order(created_at: :desc)
      end
    else
      redirect_to root_url
    end
  end

  def sortr
    session[:cas] = nil
    session[:pol] = nil
    redirect_to police_index_url
  end

  def sortable
    session[:cas] = Report.order(:created_at)
    session[:pol] = nil
    redirect_to police_index_url
  end

  def sortablel
    session[:pol] = Report.order(:x, :y)
    session[:cas] = nil
    redirect_to police_index_url
  end

  # GET /police/1
  # GET /police/1.json
  def show
  end

  # GET /police/new
  def new
    if session[:admin_id] != nil
      @police = Police.new
    else
      flash[:notice] = 'You must login as an admin to create new Policeman account'
    end
  end

  # GET /police/1/edit
  def edit
  end

  # POST /police
  # POST /police.json
  def create
    if session[:admin_id] != nil
      @police = Police.new(police_params)

      respond_to do |format|
        if @police.save
          format.html { redirect_to @police, notice: 'Police was successfully created.' }
          format.json { render :show, status: :created, location: @police }
        else
          format.html { render :new }
          format.json { render json: @police.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = 'You must login as an admin to create new Policeman account'
    end
  end

  # PATCH/PUT /police/1
  # PATCH/PUT /police/1.json
  def update
    if session[:admin_id] != nil
      respond_to do |format|
        if @police.update(police_params)
          format.html { redirect_to @police, notice: 'Police was successfully updated.' }
          format.json { render :show, status: :ok, location: @police }
        else
          format.html { render :edit }
          format.json { render json: @police.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = 'You must login as an admin to create new Policeman account'
    end
  end

  # DELETE /police/1
  # DELETE /police/1.json
  def destroy
    if session[:admin_id] != nil
      @police.destroy
      respond_to do |format|
        format.html { redirect_to police_index_url, notice: 'Police was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = 'You must login as an admin to create new Policeman account'
    end
  end

  private
    def sort_column
      Report.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_police
      @police = Police.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def police_params
      params.require(:police).permit(:police_id, :username, :password, :name)
    end
end
