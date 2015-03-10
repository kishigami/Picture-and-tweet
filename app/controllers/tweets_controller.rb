class TweetsController < ApplicationController
  before_action :redirect, except: :index  
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(image: params[:image], text: params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.delete
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(image: params[:image], text: params[:text])
  end

  private
  def create_params
    params.permit(:name, :image, :text)
  end

  def redirect
    redirect_to :action => "index" unless user_signed_in?
  end

  def id_params
    params.permit(:id)
  end
end
