class RecipesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :current_user, :only => [:edit, :update]

  # GET /recipes
  # GET /recipes.json
  def index
    @search = Recipe.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 5
    end
    @recipes = @search.results
    @recipe_pictures = RecipePicture.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new(recipe_id: @recipe.id)
    @recipe_picture = RecipePicture.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new(:recipe_id => @recipe.id)
    @recipe_picture = RecipePicture.new(params[:recipe])
    3.times {@recipe.ingredients.build}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.post_id = @recipe.post
    @recipe.user_id = current_user.id
    @recipe_picture = RecipePicture.new(params[:recipe])

    respond_to do |format|
      if @recipe.save && @recipe_picture.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
        format.json { render json: @recipe_picture, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.user_id = current_user.id
    @recipe.description = @recipe.instructions.truncate(200)

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :ok }
    end
  end
end
