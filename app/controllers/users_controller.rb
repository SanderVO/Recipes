class UsersController < ApplicationController
	# GET /tags/1
  # GET /tags/1.json
  def show
    # Load user
    @user = User.find(params[:id])

    # Load user's timeline
    @comments = @user.comments.order('created_at desc').limit(5)
    @recipes = @user.recipes.order('created_at desc').limit(5)
    @cookbooks = @user.cookbooks.order('created_at desc').limit(5)

    # @comments = Comment.where(:user_id => params[:id]).order('created_at desc')
    # @recipes = Recipe.where(:post_id => Post.where(:user_id => 101)).order('created_at desc')
    # @cookbooks = Cookbook.where(:post_id => Post.where(:user_id => 101)).order('created_at desc')
    @timeline = (@comments + @recipes + @cookbooks).sort_by(&:created_at).reverse

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def index
  	@search = Sunspot.search(User) do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 25
    end
    @users = @search.results
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Profielfoto succesvol aangepast.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end