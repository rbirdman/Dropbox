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
     ToDoItem.new("CS 360 Team Meeting","Discuss Project", "3:30 pm", ["www.ourteamwebsite.com", "www.youtube.com/watch?v=dQw4w9WgXcQ"], true),
     ToDoItem.new("ENGL 316 Write Essay", "5 pages", "11/19/13 12:00am",["How to Write.pdf"], true)]
end

def searchUser(search_val)
  ["rbirdman", "Charles Xavier", "Magneto", "Chris Rock",
   "Clark Kent", "Bruce Wayne", "Wolverine", "Aurora Monroe",
    "Jean Grey"]
end
  
  def getFoldersFromDirectory(dir)
    [Folder.new("bill.pdf","document","Today","public"),
     Folder.new("john.pdf","document", "Tomorrow","shared"),
     Folder.new("src/", "folder", "A week ago","private")]
  end
  
end
