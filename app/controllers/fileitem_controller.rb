class FileItemController < ApplicationController
  def listall
  	@files = FileItem.find(:all)
  end
  
  #Get a particular file with the file id
  def show
  	@files = FileItem.find(params[:id])
  end
  
  #Get all files that with the user id
  def listuserfiles
  	@files = FileItem.where('user_id = ?', params[:user_id])
  end
end
