class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'ログインしました'
        else
            flash.now[:alert] = 'メールアドレスまたはパスワードが正しくありません'
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, success: 'ログアウトしました'
    end
end
