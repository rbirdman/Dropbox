module DropboxHelper

class Folder
  def initialize(name, type, mod, perm)
    @name = name
    @type = type
    @modified = mod
    @permissions = perm
  end
  
  def print()
    puts @name
    puts @type
    puts @modified
    puts @permissions
  end
  
  def name
    @name
  end
  def type
    @type
  end
  def modified
    @modified
  end
  def permissions
    @permissions
  end
end

class URLLink
  def initialize(url, isLink)
    @url = url
    @isLink = isLink
  end
  def url
    @url
  end
  def isLink
    @isLink
  end
end

class ToDoItem
  def initialize(titl, det, due, res, comp)
    @title = titl
    @details = det
    @due_date = due
    @resources = res
    @completed = comp
  end
  
  def title
    @title
  end
  def details
    @details
  end
  def due_date
    @due_date
  end
  def resources
    @resources
  end
  def completed
    @completed
  end
end

def getTodoItems(dirname)
  tuple = ["www.ourteamwebsite.com", "www.youtube.com/watch?v=dQw4w9WgXcQ"]
  [ToDoItem.new("CS 360 Reading","pgs. 100-135","11/20/13 3:00pm",[], false),
     ToDoItem.new("CS 360 Team Meeting","Discuss Project", "3:30 pm", [URLLink.new("www.ourteamwebsite.com",false), URLLink.new("www.youtube.com/watch?v=dQw4w9WgXcQ", true)], true),
     ToDoItem.new("ENGL 316 Write Essay", "5 pages", "11/19/13 12:00am",[URLLink.new("How to Write.pdf", false)], true)]
end

def searchUser(search_val)
  if search_val.include? '*'
    search_val.gsub!('*', '%')
  end
  Users.where("netid LIKE ?", search_val)
end
  
  def getFoldersFromDirectory(dir)
    [Folder.new("bill.pdf","document","Today","public"),
     Folder.new("john.pdf","document", "Tomorrow","shared"),
     Folder.new("src/", "folder", "A week ago","private")]
  end
  
end
