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

  
  def getFoldersFromDirectory(dir)
    [Folder.new("bill.pdf","document","Today","public"),
     Folder.new("john.pdf","document", "Tomorrow","shared"),
     Folder.new("src/", "folder", "A week ago","private")]
  end
  
end
