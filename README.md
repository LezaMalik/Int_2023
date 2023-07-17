# Int_2023
## Learning Linux

**1. whoami**
	*This command prints the user Id.* 
		`whoami` *: displays the name of the current user*

**2. man** *(manual)*
	*This command shows the manual of a command*.
	*Example:*
		`man whoami`
			*this displays the manual of whoami command*

**3. clear**
	*This command clears the screen.*

**4. pwd** *(print working directory)*
	*This command prints the current/working directory.*

**5. ls** *(list)*
	*This command prints the list of folders in current directory.*
		`ls -a` *: lists all files & folders (hidden as well)*
		`ls -l` *: lists all files & folders in long format.*

**6. cd** 
	*This command changes the directory.*
		`cd` *: Changes the current directory (1 step forward)*
		`cd..` *: Goes back to parent folder (1 step back)*
		`cd../../..` *: Goes back to 3 folders back (3 steps back)*

**7. mkdir**
	*This command creates a directory.*
    	`mkdir pictures` *: Creates a directory with pictures name*
    	`mkdir -p folder1/folder2/folder3 ` *: Creates a nested directory*

**8. touch**
	*This command creates a file.*
    	`touch temp.txt` *: Creates a file with the name temp.txt*

**9. rmdir**
	*This command deletes empty folder/files.*

**10. rm**
	*This command deletes files/folders.*
		`rm filename` *: Deletes nonempty file.*    
		`rm -r folder` *: Deletes a folder with files inside it.( r means recursive)*

**11.  open**
	*Opens a file/folder outside the terminal but only on MAC.*
		`open filename` *: Opens the file on MAC*
		`open . ` *:  Opens the current directory on MAC*
		`xdg-open .` *: Opens the current directory on Ubuntu*
		`xdg-open filename` *: Opens the file on Ubuntu*
		

**12.  mv**
	*Renames a file.*
		`mv filename1 filename2` *: Renames filename1 to filename2*

​	*Also used to move files inside a folder/directory.*
​		`mkdir stuff` *: creates a folder name stuff*
​		`touch pie cake cookie` *: creates 3 files pie, cake and cookie*
​		`mv pie cake cookie stuff/` *:  Moves the 3 files(pie,cake,cookie) inside the folder stuff*

​		

**13.  cp**
	*Copies a file.*
		`cp filename1 filename2` *: Copes the content of the first file (filename1) to the second file (filename2)*

​	*Also used to copy a file and move the new file inside a folder/directory.*
​		`cp file.txt folder/newfile.txt` *: copies the file.txt and saves the newfile.txt inside the folder*

**14.  head**
	*Outputs the first 10 lines of a file.*
		`head filename1` *: Outputs the first 10 lines of the file*

​	*With -n we can specify the number of lines to print*
​		`head filename1 -n 100` *: Outputs the first 100 lines of the file*



**15.  tail**
	*Outputs the last 10 lines of a file.*
		`tail filename1` *: Outputs the last 10 lines of the file*

​	*With -n we can specify the number of lines to print*
​		`tail filename1 -n 100` *: Outputs the last 100 lines of the file*	



**16. date**
	*This command outputs the system date and time.*
    

**17.  > (Redirecting Standard Input - Only Overwrites)**
	*Redirects the output to the specified file.*
		`date > file.txt` *: Saves the date inside file.txt*

​	*If we add again to the same file, it replaces the content. Only overwrites does not append.*
​				

**18.  >> (Redirecting Standard Input - Appends)**
	*Redirects the output to the specified file.*
		`date >> file1.txt` *: Saves the date inside file1.txt*
		`whoami>> file1.txt` *: Saves the username inside file1.txt*

​	*If we add again to the same file, it appends the content.*



**18.  cat**
	*Outputs the whole content of the specified file.*
		`cat file1.txt` *: Prints the whole output of the file1*
		`cat file1.txt file2.txt` *: Prints the whole output of file1 and file2*

​	*For saving content into a new file, we can use redirect.* 	
​		`cat file1.txt file2.txt file3.txt > newfile`



**19.  less**
	*Outputs the whole content of the specified file in an interactive UI.*
		`less file1.txt` *: Prints the output of the file1 in an interactive UI*
	

**20.  echo**
	*It prints to the output the argument passed to it.*
		`echo "hello"` *: Prints hello to the screen*
	*It can append output to a file aswell.*
		`echo "hello" >> output.txt` *: This command will create a file output.txt and add hello to it*



**21.  wc**
	*It prints the number of lines, words and bytes in a file.*
		`wc file1.txt` *: Prints the number of lines then number words, then number of bytes in the file1.txt*

**22.  Piping**

​	*Used for taking output of one command and passing into another command.*
​	`date | wc` *: Outputs the line no, word count and bytes of date command*

`cat filename1 filename2 | wc` *: This gives the word count of both the files combined*

*Can also be used with redirect*
	`cat file1 file2 | wc -l > newfile.txt` *: This command will concatenate both the files and then count the number of lines and save them in newfile.txt*



**23.  sort**
	*It prints the sorted information on the screen, doesn't change the file.*
		`sort filename` *: Outputs the sorted file alphabetically*
	*To sort numerically, use -n*
		`sort -n filename` *: Outputs the sorted file numerically*

*For unique values use -u, for reverse sort use -r*

*For finding unique numbers in a file* 
	`sort -un filename`

*Can also be used with word count with piping*
	`sort -un filename | wc -l` *: This will give the line numbers of the uniquely sorted numbers file*



**24.  uniq**
	*It reports or omits repeated lines.*
		`uniq filename` *: Only removes adjacent duplicate values*
	*For alphabet characters, we can first sort and then pipe it to uniq command.*
	`sort filename.txt | uniq` *: This will only print unique values*

**But this can easily be done with the sort command with -u*

** For finding duplicates only, with uniq use -d*
	`sort filename.txt | uniq -d`
			*Example:* 	
					*Apples*
					*Bananas*

** For finding non-duplicates only, with uniq use -u*
	`sort filename.txt | uniq -u`
				*Example:* 	
					*Pear*

** For finding count, with uniq use -c*
	`sort filename.txt | uniq -c`
			*Example:* 	
					*4 Apples*
					*6 Bananas*
					*1 Pear*

** For finding count in asc order, with uniq use -c*
	`sort filename.txt | uniq -c | sort -n`
			*Example:* 	
					*1 Pear*	
					*4 Apples*
					*6 Bananas*
						 

**25.  Expansion**
	*First Expands then gives it to the command*
		`echo *` *: Prints the paths of all the files and folders in the current directory*
		`echo *.txt` *: Prints the paths of all the files ending with .txt in the current directory*

​		`echo *.??` *: Prints the paths of all the files ending with . and any two characters in the current directory ex: app.js, app.py*

​		`echo {a.b,c}.txt` *:  This Outputs : a.txt b.txt c.txt*

​		`touch app.{js,html,css,py}` *: This creates 4 files in the current directory with names app.js, app.html app.css and app.py*

​		`echo {1..99}` *: Prints numbers from 1 till 99*



**26.  diff**
	*It shows the difference between two files.*
	*-y : shows both files side by side*
	

**27.  find**
	*Find files and folders with different criteria (name, size, type etc).*

​	`find .` *: Finds every single nested file inside the current directory*

​	`find . -name '*.py'` *: Finds every single nested file ending with .py inside the current directory*

​	`find folderName -name '*.txt'` *: Finds every single  file inside the folder ending with .txt*

​	`find . -type d` *: Finds every single directory inside the current directory*

​	`find . -type f` *: Finds every single file inside the current directory*

​	`find . -type d -name '*E*'` *: Finds every single directory inside the current directory with E in its name*

​	*For Case-Insensitivity use i with name ( -iname )*

​	`find . -name 'E*' -or -name 'F*'` *: Finds every single directory/file inside the current directory with E and F in the start of  their name*

 

**28.  grep**
	*Search inside the files*
		`grep -r "temp" .` *: Searches for the word temp in all the nested files inside the current directory (Case Sensitive)*

​	`grep -ri "temp" .` *: Searches for the word temp in all the nested files inside the current directory (Case Insensitive)*



 **29.  du**
	*Calculates the size of directory as a whole (du ->disk usage)*

​		`du -m` *: Shows the size of directories in megabytes*

​		`du -g` *: Shows the size in gigabytes*

​		`du -h` *: Shows the size in human readable size*



**30.  df**
	*Calculates the size of mounted file system (how much space they allocate and how much is the free space left)*

​		`df -h` *: Shows the size, space etc in human readable size*



**31.  history**
	*All the commands previously done are memorized in history*

​		`history` *: Shows the history of all the previous commands used*

​		`history | grep 'cookie'` *: Shows the history of all the previous commands used with the word cookie*



**32.  ps**
	*Display info about currently running processes ( ps -> process status)*

​		`ps` *: Shows the history of all the processes running at the time*

​		`ps ax` *: Shows the history of all the processes initiated by anyone running at the time*

 

**33.  top**
	*Display top most CPU intensive processes*

​		`ps` *: Shows the history of all the processes running at the time*



**34.  kill**
	*It receives signals and then react to it: to kill a process*

​		`kill <PID>` *: Kills a process with this process id*

​		`kill -9 <PID>` *: Kills a process with this process id* (Brutally Kill) 



**35.  killall**
	*It receives signals and then react to it: to kill a program, can be more processes*

​		`killall -9 <pname>` *: Kills all the programs with the pname*

​		

**36.  jobs, bg, fg**
	

**37.  gzip**
	*Compress a file with gzip compression protocol LZ77 (Lempel Ziv coding)*

​		`gzip filename` *: Compress the file and replaces the old file with compressed one*

​		`gzip -k filename` *: Makes a new compressed file with the gz extension*

​		`gzip -d filename.gz` *: Decompresses a file*



**38.  gunzip**
	*De-Compress a file (use -k to keep the originals)*

​		`gunzip filename.gz` *: Decompresses a file*



**39.  tar**
	*Used to archive multiple files into single file (tar -> tape archive)*

​		`tar -cf archive.tar file1 file2` *: Creates a new archive file*

​	*To unarchive file, use -xf*
​		`tar -xf achive.tar` *: Extracts files in the current directory*

​		`tar -xf achive.tar -C directory` *: Extracts files in the specified directory*



**40.  nano**
	*Beginner friendly editor - can run directly from your terminal. Easily modify files*

​		`nano filename` *: Open file in terminal - can edit easily*



**41.  alias**
	*Allows us to define our own aliases. We can give names to commands and use the names in that instance. It only exists in that particular instance/terminal.*

​		`alias myls='ls -la'`

​		`myls`= *: This shows the result of ls -la command.*



**42.  xargs**
	*The core purpose of xargs command is to take standard input and turn it into list of arguments that other commands who accept.*

​		`cat filename.txt | xargs rm` *: Takes arguments from the file with the help of xargs command and passes the output (name of the files) inside the rm command.*



**43.  ln**
	*Allows us to create links. Similar to the idea of shortcut on windows. (We can access the programs with the help of shortcuts from our desktop.) Both the files are pointing to the same file. If you make changes in one file, you can see the same changes in the other file.*

​		`ln orignalfile.txt hardlink.txt`= *: Outputs the same output as the original file. They are both referring/pointing to the same file in memory.*

*HARD LINK: If you delete the original file, hardlink file will still be there because it is still pointing to the same location in the memory.*
		`ln orignalfile.txt hardlink.txt`

*SOFT LINK: If you delete the original file, softlink file will also be deleted. The soft link is pointing to the original file not the location in memory. If original is gone softlink is also gone.*
		`ln -s orignalfile.txt softlink.txt`



**44.  who**
	*When multiple users are logged in on the same system at the same time, who command displays the users logged into the system.*

​		`who`= *: Displays the users logged into the system*



**45.  su**  *(Switch User)*
	*The command allows us to switch to another user within the terminal. With exit command you can exit the current user.*

​		`su username`= *: Allows to switch user with the help of password.*



**46.  sudo** 
	*Sudo is used to run a command as root or with elevated permissions. You must be first enabled to use sudo. You can then run commands as root by entering your password. The permissions are highly configurable.*

​		`sudo <command>`



**47.  passwd** 
	*This command allows us to change the password of the user.*

​		`passwd` *: This will allow us to change password. First it asks the current password and then allows to set new password.*

*To change some other user's password, first you need to have the permission then with sudo you can change password.

​	`sudo passwrd user` *: First you need to enter your own password and then you can change the other user's password only if you have the administration permissions.*



**48.  chown** *(Change ownership)* 
	*This command allows us to change the ownership to another user. Owner of a file can do everything with it.*

​		`chown <owner> <file>` *: Allows the ownership/permissions of a file to another user.*

​	*To change the ownership of all the files and subdirectories nested in a directory, use the flag -R*
​		`chown -R <owner> <file>`



**49.  chmod** *(Change mode)* 
		*This command allows us to change the permissions of a file or directory.*
		*We need to tell:*
			*1) Who are we changing permissions for*
					*(u - user/owner of file)*
					*(g - group/member of the group)*					
					*(o - others)*					
					*(a - all of the above)*	

​			*2) what changes are we making*
​					*( - (minus sign) removes permission)*
​					( + (plus sign) grants permission)
​					*( = (equals sign) set a permission and remove others)*

​			*3) which permissions are we setting.*
​					*(r - read permission)*
​					*(w - write permission)*
​					*(x - execute permission)*


​		*Example:*	

​						`chmod mode <file>` 

​				`chmod u+x <file>`  *: Grants permission to the user of the file to execute .*

​				`chmod a-x <file>`  *: Removes permission from all (user, group, others) to execute.*

​				`chmod a+w <file>`  *: Grants permission of write to all (user, group, others).*
