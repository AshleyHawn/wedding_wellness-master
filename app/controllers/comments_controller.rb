class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @comment.daily_note_id = DailyNote.find(params[:daily_note_id])
  end

  def new
    @comment = Comment.new(daily_note_id: params[:daily_note_id])
  end

  def create
    @comment = Comment.new
    @comment.daily_note_id = params[:daily_note_id]
    @comment.text = params[:text]

    if @comment.save
      redirect_to "/comments", :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.daily_note_id = params[:daily_note_id]
    @comment.text = params[:text]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end
