class TimelineController < ApplicationController
	# GET /tags
  # GET /tags.json
  def index
  	@comments = Comment.order('created_at desc').limit(5)
		@recipes = Recipe.order('created_at desc').limit(5)
		@cookbooks = Cookbook.order('created_at desc').limit(5)
		@timeline = (@comments + @recipes + @cookbooks).sort_by(&:created_at).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timeline }
    end
  end
end