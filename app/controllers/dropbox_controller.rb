class DropboxController < ApplicationController
  def home
  end
  def todo
    title = params[:title]
    details = params[:details]
    due_date = params[:duedate]
    resources = params[:resources]
    resourceAsLink = params[:link] || false
    
    Rails.logger.debug "Creating ToDo"
    
    Rails.logger.debug "Title: " + (title == nil ? "nil" : title)
    Rails.logger.debug "Details: " + (details == nil ? "nil" : details)
    Rails.logger.debug "Due Date: " + (due_date == nil ? "nil" : due_date)
    Rails.logger.debug "Resources: " + (resources == nil ? "nil" : resources)
    Rails.logger.debug "link: " + (resourceAsLink == false ? "false" : "true")
    
    if title == nil || details == nil || due_date == nil || resources == nil
      Rails.logger.debug "Deny List"
    else
      Rails.logger.debug "Accept List"
    end
    
  end
end
