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

def getFileItems()
if current_user != nil
  FileItem.where("user_id = ?", current_user.id)
end
end

def getTodoItems()
	if current_user != nil
		return ToDoItem.where("user_id = ?", current_user.id)
	end
	[]
end

def searchUser(search_val)
  if search_val.include? '*'
    search_val=search_val.gsub!('*', '%')
  end
  User.where("netid LIKE ?", search_val).pluck(:netid)
end

def extensionToType(ext)
	if ext==".exe"
		return "application"
	end
	if ext==".wav"
		return "WAV file"
	end
	if ext==".mov"
		return "movie"
	end
	"document"
end

def fileToFolder(file)
	Folder.new(file.name,extensionToType(file.file_extension),time_ago_in_words(file.updated_at),file.permissions)
end

def folderToFolder(fold)
	Folder.new(fold.name,"folder",time_ago_in_words(fold.updated_at),fold.permissions)
end

def getFoldersFromDirectory(dir)
	dir||="/"
	
	if current_user == nil
	  return
	end
	
	uid=current_user.id
	Rails.logger.warn uid
	if params[:id]=="guest"
		uid=-1
	end
	
	FileItem.where("path = ? and user_id = ?",dir,uid)
end

end
