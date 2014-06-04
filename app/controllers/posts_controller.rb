include PostsHelper

class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new 
        @comment.post_id = @post_id
    end 

    def new
        @post = Post.new
        @comment = Comment.new 
        @comment.post_id = @post_id
    end 

    def create
        @post = Post.new
        @post = Post.new(post_params)
        @post.save
        flash.notice = "Post '#{@post.title}' Created!"
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        
        flash.notice = "Post '#{@post.title}' Updated!"
    
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        flash.notice = "Post '#{@post.title}' Deleted!"
        
        redirect_to action: "index"
    end 

end
