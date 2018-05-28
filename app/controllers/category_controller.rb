class CategoryController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!

	def index
		@categoryies = Category.where(user_id: current_user)
	end

	def show
	end

	def new
		@category = current_user.categoryies.build
	end

	def create
		@category = current_user.categoryies.build(category_params)

		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to @category
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		redirect_to categorys_path
	end

	private

	def find_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name,:project)
	end
end
