class UsersController < ApplicationController

    before_action :authorized, only: [:keep_logged_in]

    def index
        # byebug
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid
            wristband_token - encode_token({user_id: @user.id})

            render json: {
                user: UserSerializer.new(@user),
                token: wristband_token
            }
        else
            render json: {error: "INVALID USER"}, status: 422
        end
    end


    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            wristband_token = encode_token({user_id: @user.id})

            render json: {
                user: UserSerializer.new(@user), 
                token: wristband_token
            }

        else
            render json: {error: "INCORRECT USERNAME OR PASSWORD!!!"}, status: 422
        end
    end


    def keep_logged_in
        wristband_token = encode_token({user_id: @user.id})

        render json: {
            user: UserSerializer.new(@user), 
            token: wristband_token
        }
    end

    private
    
    def user_params
        params.permit(:username, :password)
    end

end
