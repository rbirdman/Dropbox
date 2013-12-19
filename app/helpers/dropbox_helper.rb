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
  tidval=params[:id]
  tidval||=12
  FileItem.where("user_id = ?", tidval)
end

def getTodoItems()
	tidval=params[:id]
	tidval||=7
	ToDoItem.where("user_id = ?", tidval)
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
	uid=params[:id]
	Rails.logger.warn params[:id]
	if params[:id]=="guest"
		uid=-1
	end
	uid||=-1
	fitems=FileItem.where("path = ? and user_id = ?",dir,uid)
	folderItems=[]
	fitems.each do |f|
		folderItems.push(fileToFolder(f))
	end
	fitems=FolderItem.where("path = ? and user_id = ?",dir,uid)
	fitems.each do |f|
		folderItems.push(folderToFolder(f))
	end
	if folderItems.length==0
		folderItems.push(Folder.new("No Items","---","---","---"))
	end
	folderItems
end

end
