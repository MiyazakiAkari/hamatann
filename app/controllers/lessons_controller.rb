class LessonsController < ApplicationController
    def index
        @lessons = Lesson.all
    end

    def show
        @lesson = Lesson.find(params[:id])
        @reviews = @lesson.reviews
        @review = Review.new
    end

    def new
        @lesson = Lesson.new
    end

    def edit
        @lesson = current_user.lessons.find(params[:id])
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
        if @lesson.save
            redirect_to lesson_path(@lesson), success: '授業を登録しました'
        else
            flash.now[:alert] = '授業の登録に失敗しました'
            render :new
        end
    end

    def update
        @lesson = current_user.lessons.find(params[:id])
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson), success: '授業を更新しました'
            @lesson.edited = true
        else
            flash.now[:alert] = '授業の更新に失敗しました'
            render :edit
        end
    end

    def destroy
        @lesson = current_user.lessons.find(params[:id])
        @lesson.destroy!
        redirect_to lessons_path, success: '授業を削除しました'
    end

    private
    def lesson_params
        params.require(:lesson).permit(:title, :semester, :day, :time, :teacher, :course)
    end
end
