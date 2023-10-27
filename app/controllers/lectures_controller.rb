class LecturesController < ApplicationController
    def index
        @lectures = Lecture.all
    end

    def home
    end

    def show
        @lecture = Lecture.find(params[:id])
        @review = Review.new
        @user = @lecture.user_id
    end

    def new
        @lecture = Lecture.new
    end
    
    def create
        @lecture = current_user.lecture.build(lecture_params)
        if @lecture.save
          flash[:success] = "授業が登録されました"
          redirect_to @lecture
        else
          flash[:error] = "授業の登録に失敗しました"
          render 'new'
        end
    end

    def review
        @lecture = Lecture.find(params[:id])
        @review = @lecture.review
    end
    
    private
    def lecture_params
        params.require(:lecture).permit(:semester, :day, :time, :course, :title, :teacher, :edited, :where, :faculty, :user_id)
    end

    def edit
        @lecture = Lecture.find(params[:id])
    end

    def update
        @lecture = Lecture.find(params[:id])
        if @lecture.update_attributes(params[:id])
          flash[:success] = "授業の更新に成功しました"
          edited = true
          @lecture.updater = current_user
          redirect_to @lecture
        else
          flash[:error] = "授業の更新に失敗しました"
          render 'edit'
        end
    end

    def destroy
        @lecture = Lecture.find.current_user(params[:id])
        if @lecture.destroy
            flash[:success] = '授業が削除されました'
            redirect_to lectures_path
        else
            flash[:error] = '授業の削除に失敗しました'
            redirect_to lectures_path
        end
    end
    
    
    
end
