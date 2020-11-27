class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    # def create
    #     byebug
    #     # @user = User.find_by(name: user_login_params[:name])
    #     # #User#authenticate comes from BCrypt
    #     # if @user && @user.authenticate(user_login_params[:password])
    #     #   # encode token comes from ApplicationController
    #     #   token = encode_token({ user_id: @user.id })
    #     #   render json: { user: UserSerializer.new(@user), jwt: token }, status: :acc epted
    #     # else
    #     #   render json: { message: 'Invalid username or password' }, status: :unauthorized
    #     # end
    #   end
    

    # private 

    # def user_login_params
    #     params.require(:user).permit(:name, :password)
    # end

    def create 
        user = User.find_by(name: params[:name])

        if user && user.authenticate(params[:password])
            render json: {name: user.name, token: encode_token({user_id: user.id})}
        else 
            render json: {error: 'invalid username or password'}
        end
    end

end
