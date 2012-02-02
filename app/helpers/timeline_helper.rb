module TimelineHelper
	def getGlobalTimeline
		buildTimeline
	end

	private
	def buildTimeline
		comments = Comment.order('created_at desc')
		recipes = Recipe.order('created_at desc')
		cookbooks = Cookbook.order('created_at desc')
		timeline = (@comments + @recipes + @cookbooks).sort_by(&:created_at).reverse
	end
end