class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
    def index
      @lecture = Lecture.find(params[:id])
      @review = @lecture.review
    end

    def new
        @lecture = Lecture.find(params[:id])
        @review = Review.new
    end

    def edit
      @lecture = Lecture.find(params[:id])
      @review = Review.find(params[:id])
    end

    def create
        @lecture = Lecture.find(params[:id])
    
        @review = @lecture.review.new(review_params)
        @review.user = current_user 
    
        if @review.save
          redirect_to @lecture, notice: 'レビューが作成されました。'
        else
          render 'new'
        end
    end
    
    private
    
    def review_params
        params.require(:review).permit(:title, :body, :star)
    end
end
