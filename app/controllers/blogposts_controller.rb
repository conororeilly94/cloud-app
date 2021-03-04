class BlogpostsController < ApplicationController
  before_action :authenticate_account!, only: [ :new, :create ]
  before_action :set_blogpost, only: [ :show, :edit, :update, :destroy ]
  before_action :can_access?, except: [ :show, :latest ]

  # GET /blogposts or /blogposts.json
  def index
    @blogposts = Blogpost.all
  end

  def latest
    @blogposts = Blogpost.active
  end

  # GET /blogposts/1 or /blogposts/1.json
  def show
  end

  # GET /blogposts/new
  def new
    @blogpost = Blogpost.new
  end

  # GET /blogposts/1/edit
  def edit
  end

  # POST /blogposts or /blogposts.json
  def create
    @blogpost = Blogpost.new(blogpost_params)

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to @blogpost, notice: "Blogpost was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogposts/1 or /blogposts/1.json
  def update
    respond_to do |format|
      if @blogpost.update(blogpost_params)
        format.html { redirect_to @blogpost, notice: "Blogpost was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogposts/1 or /blogposts/1.json
  def destroy
    @blogpost.destroy
    respond_to do |format|
      format.html { redirect_to blogposts_url, notice: "Blogpost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogpost
      @blogpost = Blogpost.find(params[:id])
    end

    def can_access?
      @show_sidebar = true 

      unless current_account.administrator?
          redirect_to root_url, flash: { danger: "You do not have access to view this page" }
      end
  end

    # Only allow a list of trusted parameters through.
    def blogpost_params
      params.require(:blogpost).permit(:title, :url, :summary, :body, :image, :active)
    end
end
