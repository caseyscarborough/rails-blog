require 'will_paginate/array'

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authorize,
                only: [:edit, :update, :destroy, :approve, :approvals]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    current_user ? @comment.approved == true : @comment.approved == false

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post.permalink, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
        format.js
      else
        flash[:error] = 'There was an error saving the comment.'
        format.html { redirect_to @post.permalink }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post.permalink, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post.permalink, notice: 'Comment was successfully deleted' }
      format.json { head :ok }
      format.js
    end
  end

  def approve
    @comment = Comment.find(params[:id])
    if !@comment.approved && current_user
      @comment.approved = true
      @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def approvals
    @comments = Comment.unapproved_comments
    @comments = @comments.paginate(page: params[:page], per_page: 10)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :email, :content, :post_id)
    end
end
