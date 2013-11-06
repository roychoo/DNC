class DatafilesController < ApplicationController
  before_action :set_datafile, only: [:show, :edit, :update, :destroy]

  # GET /datafiles
  # GET /datafiles.json
  def index
    @datafiles = Datafile.all
  end

  # GET /datafiles/1
  # GET /datafiles/1.json
  def show
  end

  # GET /datafiles/new
  def new
    @datafile = Datafile.new
  end

  # GET /datafiles/1/edit
  def edit
  end

  # POST /datafiles
  # POST /datafiles.json
  def create
    p 'hello'
    p params.inspect
    p 'hello end'
    file = params[:datafile][:name]
    @datafile = Datafile.new(:name => file.original_filename)
    respond_to do |format|
      if @datafile.save
        format.html { redirect_to @datafile, notice: 'Datafile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @datafile }
      else
        format.html { render action: 'new' }
        format.json { render json: @datafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datafiles/1
  # PATCH/PUT /datafiles/1.json
  def update
    respond_to do |format|
      if @datafile.update(datafile_params)
        format.html { redirect_to @datafile, notice: 'Datafile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @datafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datafiles/1
  # DELETE /datafiles/1.json
  def destroy
    @datafile.destroy
    respond_to do |format|
      format.html { redirect_to datafiles_url }
      format.json { head :no_content }
    end
  end

  def upload
    uploaded_io = params[:person][:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datafile
      @datafile = Datafile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datafile_params
      params.require(:datafile).permit(:name)
    end
end
