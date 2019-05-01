class PostsController < ApplicationController

    def index
        @posts = Post.all 
    end 

    def show 
#this will show an individual post 
        @post = Post.find(params[:id])
    end 

    def new 
#display form to create a new post 
        @post = Post.new 
    end 

    def create 
#the form from new action will submit to this and crerate will save it to database 
        @post = Post.new(post_params) #added .permit(:title, :content) to get rid of action not allowed error. 
        
        if @post.save 
            redirect_to posts_path, :notice => "Your post was saved"
       else 
            render "new"
       end 
    end 

    def edit 
#displays form for editing post 
       @post = Post.find(params[:id]) 
    end 

    def update 
#this is used for actually updating the post using the above form
        @post = Post.find(params[:id])  

        if @post.update_attributes(post_params)
            redirect_to posts_path, :notice => "Your post has been updated"
        else 
            render "edit"
        end 
    end 

    def destroy 
#this will delete the post
        @post = Post.find(params[:id])
        @post.destroy  
        redirect_to posts_path, :notice => "Your post has been deleted!"
    end 

    #only index , show, new and edit have view pages 

    private 
    def post_params
        params.require(:post).permit(:title, :content)
    end 
end
