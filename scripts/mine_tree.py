import os
import stat
import datetime



def file_info_method(file_path):
  
    # Getting file status
    stat_info = os.stat(file_path)  

    # Getting file permissions in symbolic format(r-w-x)
    permissions = stat.filemode(stat_info.st_mode)

    # Getting owner (If on Linux/Mac returns Owner Name else returns None on windows)
    owner = os.getlogin() if os.name == 'posix' else None

    # Getting file size
    size = stat_info.st_size

    # Getting last modified date (year - month - date)
    last_modified = datetime.datetime.fromtimestamp(stat_info.st_mtime).strftime('%Y-%m-%d')

    # Getting absolute path
    absolute_path = os.path.abspath(file_path)
    
    # Getting filename
    filename = os.path.basename(file_path)
    
    # Returns a comma separated string with file details
    details_str = f"{permissions}, {owner}, {size}, {last_modified}, {absolute_path}, {filename}"
    
    return details_str


def walk_through_dir_method(directory):
        
        # The os.walk() function returns a tuple, every time it visits a directory, it has 3 items:
        # 1. current directory path (root), 2. List of subDirectories, 3. list of filenames in current directory(files)
        # In for loop, we have root for curr dir, - as we dont need subdirectories, and files  
        # The os.walk() function automatically traverses the directory tree with recursion visiting all the subdirectories
        # that is how we can iterate through all the files in subdirectories as well
          
    for root, _, files in os.walk(directory):
        
        # we have list of files from the curr dir, and to iterate through a single file for loop is used
        for file in files:
            
            # by joining the root path with filename, abs path is obtained
            file_path = os.path.join(root, file)
            
            # By calling the method which takes abs path as input and returns a string of comma separated details
            file_details = file_info_method(file_path)
            
            print(file_details)

if __name__ == "__main__":
    directory_path = input("Please enter the path: ")
    walk_through_dir_method(directory_path)
