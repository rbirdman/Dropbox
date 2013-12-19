class DropboxController < ApplicationController
  def home
  end
  def todo
    user = nil
    if current_user
      user = current_user.netid
    end
    title = params[:title]
    details = params[:details]
    due_date = params[:duedate]
    resources = params[:resources] || ""
    resourceAsLink = params[:link] || false

    Rails.logger.debug "Creating ToDo"

    Rails.logger.debug "User: " + (user == nil ? "nil" : user.to_s())
    Rails.logger.debug "Title: " + (title == nil ? "nil" : title)
    Rails.logger.debug "Details: " + (details == nil ? "nil" : details)
    Rails.logger.debug "Due Date: " + (due_date == nil ? "nil" : due_date)
    Rails.logger.debug "Resources: " + (resources == nil ? "nil" : resources)
    Rails.logger.debug "link: " + (resourceAsLink == false ? "false" : "true")

    if user == nil || title == nil || details == nil || due_date == nil
      Rails.logger.debug "Deny List"
    else
      Rails.logger.debug "Accept List"
      user = User.where("netid = ?", user)
      user = user[0]
      Rails.logger.debug "id: " + user.id.to_s()
      ToDoItem.create(:user_id => user.id, :title => title, :details => details,
      		:date => due_date, :resources => resources, :completed => false)
      		#:date => due_date, :resources => resources, :link => resourceAsLink, :completed => false)

    end

  end

def uploadFile
  if current_user != nil
   require 'fileutils'
   FileItem.create(:name => params[:file_upload][:my_file].original_filename, :file => params[:my_file], :permissions => "read/write",
    :file_extension => params[:file_upload][:my_file].content_type, :created_at => nil, :updated_at => nil, :user_id => current_user.id, :path => "the_path");
  end

   redirect_to :root
end

end
