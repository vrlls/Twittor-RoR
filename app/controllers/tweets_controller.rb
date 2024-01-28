class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tweets = Tweet.all
    end

    #Blank form GET
    def new
        @tweets = Tweet.new
    end

    #POST
    def create
        @tweets = Tweet.new(tweet_params)
        @tweets.user_id = current_user.id
        
        if @tweets.save
            redirect_to(tweets_path)
        else
            render :new
        end
    end

    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to tweets_path
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def edit
        @tweet = Tweet.find(params[:id])
        @user = current_user
    end

    def update
        @tweet = Tweet.find(params[:id])
        
        if @tweet.update(tweet_params)
            redirect_to tweets_path
        else
            "TODO: Add flash new message"
            render :new
        end
    end

    private
    def tweet_params
        params.require(:tweet).permit(:content)
    end
end
