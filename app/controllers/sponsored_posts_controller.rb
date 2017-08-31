class SponsoredPostsController < ApplicationController
  def show
    @sponsoredpost = SponsoredPost.find(params:[:id])
  end

  def new
    @topic = Topic.find(params:[:id])
    @sponsoredpost = SponsoredPost.new
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params:[:id])
  end

  def create
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params:[:sponsoredpost][:title]
    @sponsoredpost.body = params:[:sponsoredpost][:body]
    @sponsoredpost.price = params:[:sponsoredpost][:price]
    @topic = Topic.find(params:[:id])

    if @sponsoredpost.save

      flash[:notice] = "Sponsored post was saved."
      redirect_to [@topic, @sponsoredpost]

    else

      flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
      render :new

    end
  end

  def destroy
    @sponsoredpost = SponsoredPost.find(params:[:id])

    if @sponsoredpost.destroy
      flash[:notice] = "\"#{@sponsoredpost.title}\" was sucessfully deleted."
      redirect_to @sponsoredpost.topic

    else
      flash.now[:alert] = "There was an error trying to delete the sponsored post.  Please try again."
      render :show
    end
  end

  def update
    @sponsoredpost = SponsoredPost.find(params:[:id])
    @sponsoredpost.title = params:[:sponsoredpost][:title]
    @sponsoredpost.body = params:[:sponsoredpost][:body]
    @sponsoredpost.price = params:[:sponsoredpost][:body]

    if @sponsoredpost.save
      flash[:notice] = "The sponsored post has been updated."
      redirect_to [@topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error updating the sponsored post.  Please try again."
      render :edit

    end
  end

end
