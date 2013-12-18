class DropboxController < ApplicationController
  def home
  end
  def todo
    title = params[:title]
    details = params[:details]
    due_date = params[:duedate]
    resources = params[:resources]
    
    Rails.logger.debug "Creating ToDo"
    
    if title != nil
 	   Rails.logger.debug "Title: " + title
    else
      Rails.logger.debug "Nil variable: title"
    end
    if details != nil
      Rails.logger.debug "Details: " + details
    else
      Rails.logger.debug "Nil variable: details"
    end
    if due_date != nil
      Rails.logger.debug "Due Date: " + due_date
    else
      Rails.logger.debug "Nil variable: due_date"
    end
    if resources != nil
      Rails.logger.debug "Resources: " + resources
    else
      Rails.logger.debug "Nil variable: resources"
    end
    
    if title == nil || details == nil || due_date == nil || resources == nil
      Rails.logger.debug "Deny List"
    else
      Rails.logger.debug "Accept List"
    end
    
  end
end
