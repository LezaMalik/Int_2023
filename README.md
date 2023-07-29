# Int_2023
## Learning Linux


### 1. whoami

This command prints the current user logged in.The output displays the username of the effective user in the current shell.
		
  		`whoami` : displays the name of the current user

    
![whoami picture](./assets/whoami.JPG)
   




### 2. man *(manual)*

This command shows the manual of a command. It provides a detailed view of the command which includes NAME, SYNOPSIS, 		DESCRIPTION, OPTIONS, EXIT STATUS, RETURN VALUES, ERRORS, FILES, VERSIONS, EXAMPLES, AUTHORS and SEE ALSO.
	
 **Example:**		
  		
		`man ls` : this displays the manual of ls command

    
![man picture](./assets/man.JPG)





### 3. clear

This command clears the screen.We can clear our terminal by using short cut `CTRL+L`.





### 4. pwd *(print working directory)*

This command prints the full name of the current/working directory.


![pwd picture](./assets/pwd.JPG)





### 5. ls *(list)*

This command prints the list of folders in current directory.It is designed to list the names and features of files and directories. It can be used for a single file or as many as all files and folders in a selected set of directories.

Following are the flags used with ls command:

* `ls -a`	*list all files including hidden file starting with '.'.*
* `ls -d`	*list directories - with ' */'.*
* `ls -l`	*list with long format - show permissions.*
* `ls -F`	*Append indicator (one of */=>@|) to entries.*
* `ls -lh`	*This command will show you the file sizes in human readable format.*
* `ls -r`	*list in reverse order.*
* `ls -i`	*list file's inode(index) number.*
* `ls -ltr`	*View Reverse Output Order by Date.*
* `ls -t`	*sort by time & date.*
* `ls -n`	*It is used to print group ID and owner ID instead of their names.*
* `ls -m`	*A list of entries separated by commas should fill the width.*
* `ls -g`	*This allows you to exclude the owner and group information columns.*
* `ls -q`	*Force printing of non-graphic characters in file names as the character `?';.*
* `ls -Q`	*Place double quotations around the entry names.*

   
![ls picture](./assets/ls.JPG)





### 6. cd *(change directory)*

It is used to change the current directory of the terminal. The terminal, by default, opens the home directory.
		
  		
		`cd dir` *	: Changes the current directory (1 step forward)*
		`cd..` *	: Goes back to parent folder (1 step back)*
		`cd../../..` *	: Goes back to 3 folders back (3 steps back)*





### 7. mkdir *(make directory)*

This command creates a directory. This command can create multiple directories at once as well as set the permissions for the directories.
	
 		`mkdir pictures` : Creates a directory with pictures name
		`mkdir -p folder1/folder2/folder3 ` : Creates a nested directory





### 8. touch
	
 This command creates a file. It can make an empty file or modify the file timestamps (file access time, last date, or modification).
    		
		`touch temp.txt` : Creates a file with the name temp.txt





### 9. rmdir *(remove directory)*
	
The rmdir command removes the directory, specified by the Directory parameter, from the system. The directory must be empty before you can remove it, and you must have write permission in its parent directory.





### 10. rm *(remove)*
	
 It is used to remove files, directories, and links. By default, it does not remove directories. This command normally works silently and it should be used carefully, because once you delete a file in Linux the content cannot be recovered.

  
  		`rm filename`  : Deletes nonempty file.
  		`rm -r folder` : Deletes a folder with files inside it.( r means recursive)





### 11.  open
	
 Open command opens a file/folder outside the terminal but only on MAC.
 
 		`open filename` : Opens the file on MAC
		`open . ` 	:  Opens the current directory on MAC

  
xdg-open opens a file or URL in the user's preferred application. If a URL is provided the URL will be opened in the user's preferred web browser. If a file is provided the file will be opened in the preferred application for files of that type. xdg-open supports file, ftp, http and https URLs.
	
		`xdg-open .` 		: Opens the current directory on Ubuntu
		`xdg-open filename`	: Opens the file on Ubuntu
  



  
### 12.  mv *(move)*
	
 Renames a file. We can use the mv command to move files and directories from one directory to another or to rename a file or directory. If you move a file or directory to a new directory without specifying a new name, it retains its original name.
		
  		
    		`mv filename1 filename2` : Renames filename1 to filename2


​Also used to move files inside a folder/directory.

		`mkdir stuff` 			: creates a folder name stuff
		`touch pie cake cookie` 	: creates 3 files pie, cake and cookie    
		`mv pie cake cookie stuff/` 	: Moves the 3 files(pie,cake,cookie) inside the folder stuff





### 13.  cp *(copy)*
	
Copies a file. Use the cp command to create a copy of the contents of the file or directory specified by the SourceFile or SourceDirectory parameters into the file or directory specified by the TargetFile or TargetDirectory parameters.
 
 		`cp filename1 filename2` : Copes the content of the first file (filename1) to the second file (filename2)


​Also used to copy a file and move the new file inside a folder/directory.
		
  		`cp file.txt folder/newfile.txt` : copies the file.txt and saves the newfile.txt inside the folder





### 14.  head
	
Linux head command prints the first lines of one or more files (or piped data) to standard output. By default, it shows the first 10 lines. However, head provides several arguments that can be used to modify the output.
 Following are the flags used with head:
 
*	 `-n / --lines`		*show the specified number of lines*
* 	`-c / --bytes`		*show the specified number of bytes*
* 	`-v / --verbose`	*show the file name tag*
* 	`-q / --quiet`		*don't separate the content of multiple files with a file name tag*
 

  			`head filename1` 	: Outputs the first 10 lines of the file
			`head filename1 -n 100` : Outputs the first 100 lines of the file


![head picture](./assets/head.JPG)





### 15.  tail
	
 Tail is a command which prints the last few number of lines (10 lines by default) of a certain file, then terminates.
 
*	 `-n / --lines`		*show the specified number of lines*
* 	`-c / --bytes`		*show the specified number of bytes*
*	 `-v / --verbose`	*show the file name tag*	
*	 `-q / --quiet`		*don't separate the content of multiple files with a file name tag*


  		 tail filename1` : Outputs the last 10 lines of the file


​With -n we can specify the number of lines to print

		`tail filename1 -n 100` : Outputs the last 100 lines of the file





### 16. date
	
This command outputs the system date and time. Date command is also used to set date and time of the system. By default the date command displays the date in the time zone on which unix/linux operating system is configured.

 
These are the most common formatting characters for the date command:	

* 	`%D` – Display date as mm/dd/yy
* 	`%Y` – Year (e.g., 2020)
* 	`%m` – Month (01-12)
* 	`%B` – Long month name (e.g., November)
* 	`%b` – Short month name (e.g., Nov)
* 	`%d` – Day of month (e.g., 01)
* 	`%j` – Day of year (001-366)
*	`%u` – Day of week (1-7)
*	`%A` – Full weekday name (e.g., Friday)
*	`%a` – Short weekday name (e.g., Fri)
* 	`%H` – Hour (00-23)
* 	`%I` – Hour (01-12)
* 	`%M` – Minute (00-59)
* 	`%S` – Second (00-60)





### 17.  > (Redirecting Standard Input - Only Overwrites)
	
Redirects the output to the specified file.
		
		`date > file.txt` : Saves the date inside file.txt
  
If we add again to the same file, it replaces the content. Only overwrites does not append.
​				




### 18.  >> (Redirecting Standard Input - Appends)
	
Redirects the output to the specified file.
		
  		`date >> file1.txt` : Saves the date inside file1.txt
		
		`whoami>> file1.txt` : Saves the username inside file1.txt

If we add again to the same file, it appends the content.





### 19.  cat
	
Outputs the whole content of the specified file. It helps us to create, view, and concatenate files.
		
  		`cat file1.txt` 		: Prints the whole output of the file1
    		
		`cat file1.txt file2.txt` 	: Prints the whole output of file1 and file2


​For saving content into a new file, we can use redirect.

		`cat file1.txt file2.txt file3.txt > newfile`





### 20.  less
	
Outputs the whole content of the specified file in an interactive UI. The less command is Linux utility which can be used to read contents of text file one page (one screen) per time. It has faster access because if the file is large, it doesn't access the complete file, but accesses it page by page.
		
  
		`less file1.txt` : Prints the output of the file1 in an interactive UI





### 21.  echo
	
It prints to the output the argument passed to it. It is one of the basic Linux commands used in shell scripting and Bash files to display output status text at the command line.
 
		`echo "hello"` : Prints hello to the screen
  
It can append output to a file aswell.
		
		`echo "hello" >> output.txt` : This command will create a file output.txt and add hello to it





### 22.  wc *(word count)*
	
The Linux wc command calculates a file's word, line, character, or byte count. Far from just being a utility for word processing, wc is a useful tool for a variety of system tasks.

 
Some useful command line options supported by the wc command are as following:


* 	-c, --bytes		: It is used to print the byte counts.	
* 	-m, --chars		: It is used to print the character counts.
* 	-l, --lines		: It is used to print the newline counts.	
*	 --files0-from=F	: It is used to read input from specified files.	
* 	-L, --max-line-length	: It is used to print the maximum display width.	
* 	-w, --words		: It is used to print the word counts.	
* 	--help			: It is used to display the help manual.	
* 	--version		: It is used to display the version information.

  
   		wc file1.txt` : Prints the number of lines then number words, then number of bytes in the file1.txt

  
![wc picture](./assets/wc.JPG)





### 23.  Piping
​	
The pipe is used to combine two or more commands, and in this, the output of one command acts as input to another command, and this command's output may act as input to the next command, and so on. It can also be visualized as a temporary connection between two or more commands/ programs/ processes.

		`date | wc` *: Outputs the line no, word count and bytes of date command*

		`cat filename1 filename2 | wc` *: This gives the word count of both the files combined*


Can also be used with redirect:
	
 		`cat file1 file2 | wc -l > newfile.txt` *: This command will concatenate both the files and then count the number of lines and save them in newfile.txt*





### 24.  sort
	
It prints the sorted information on the screen, doesn't change the file.  This command processes on your data (the content of the file or output of any command) and reorders it in the specified way, which helps us to read the data efficiently.

Following are the flags used with sort:

* -b	--ignore-leading-blanks		Causes sort to ignore leading blanks.
* -d	--dictionary-order		Causes sort to consider only blanks and alphanumeric characters.
* -f	--ignore-case			Ignores the default case, changes all lowercase letters to uppercase before comparison.
* -M	--month-sort			Sorts lines according to months (Jan-Dec).
* -h	--human-numeric-sort		Compares human-readable numbers (e.g., 2K 1G).
* -n	--numeric-sort			Compares data according to string numerical values.
* -R	--random-sort			Sorts data by a random hash of keys but groups identical keys together.
* /	--random-source=FILE		Gets random bytes from the specified FILE.
* -r	--reverse			Reverses the comparison results.
* -c	--check,			--check=diagnose-first	Checks if the input is already sorted but doesn't sort it.
* /	--debug				Annotates the part of the line used for sorting.
* -k	--key=KEYDEF			Sort data using the specified KEYDEF, which gives the key location and type.
* -m	--merge				Causes sort to merge already sorted files.
* -o	--output=FILE			Redirects the output to FILE instead of printing it in standard output.
* -t	--field-separator=SEP		Uses the specified SEP separator instead of non-blank to blank transition.
* -z	--zero-terminated		Causes sort to use NUL as the line delimiter instead of the newline character.
* /	--help				Displays the help file with full options list and exits.
* /	--version			Outputs the program version and exits.
 
		

  		`sort filename` : Outputs the sorted file alphabetically

 
 To sort numerically, use -n
 
		`sort -n filename` : Outputs the sorted file numerically

For unique values use -u, for reverse sort use -r

For finding unique numbers in a file
		
		`sort -un filename`

Can also be used with word count with piping
	
		`sort -un filename | wc -l` : This will give the line numbers of the uniquely sorted numbers file





### 25.  uniq
	
 It reports or omits repeated lines.

		`uniq filename` *: Only removes adjacent duplicate values*


For alphabet characters, we can first sort and then pipe it to uniq command.
	
 		`sort filename.txt | uniq` *: This will only print unique values*

But this can easily be done with the sort command with -u


For finding duplicates only, with uniq use -d
		
  		`sort filename.txt | uniq -d`

*Example:* 	

*Apples*

*Bananas*

For finding non-duplicates only, with uniq use -u
	
		`sort filename.txt | uniq -u`
			
*Example:* 	
	
 *Pear*


For finding count, with uniq use -c

		`sort filename.txt | uniq -c`
			
*Example:* 	

*4 Apples*
 
*6 Bananas*
   
*1 Pear*


For finding count in asc order, with uniq use -c

		`sort filename.txt | uniq -c | sort -n`
			
*Example:* 

*1 Pear*	
 
*4 Apples*
  	
*6 Bananas*





### 26.  Expansion
	
Each time we type a command line and press the enter key, bash performs several processes upon the text before it carries out our command.
		
		`echo *` : Prints the paths of all the files and folders in the current directory

  
		`echo *.txt` : Prints the paths of all the files ending with .txt in the current directory


		`echo *.??` : Prints the paths of all the files ending with . and any two characters in the current directory ex: app.js, app.py


		`echo {a.b,c}.txt` :  This Outputs : a.txt b.txt c.txt

 
		`touch app.{js,html,css,py}` *: This creates 4 files in the current directory with names app.js, app.html app.css and app.py*
  

		`echo {1..99}` : Prints numbers from 1 till 99





### 27.  diff
	
 It shows the difference between two files. It can also compare the contents of directories.
		
		*-y : shows both files side by side*





### 28.  find
	
Find files and folders with different criteria (name, size, type etc).

		`find .` : Finds every single nested file inside the current directory	
		
  		`find . -name '*.py'` : Finds every single nested file ending with .py inside the current directory
	​	
 		`find folderName -name '*.txt'` : Finds every single  file inside the folder ending with .txt
   
		`find . -type d` : Finds every single directory inside the current directory
	​	
 		`find . -type f` : Finds every single file inside the current directory
	​	
 		`find . -type d -name '*E*'` : Finds every single directory inside the current directory with E in its name



​For Case-Insensitivity use i with name ( -iname )


		`find . -name 'E*' -or -name 'F*'` : Finds every single directory/file inside the current directory with E and F in the start of  their name




 
### 29.  grep
	
Grep, or global regular expression print, is one of the most versatile and useful Linux commands available. It works by searching for text and strings that users define in a given file. In other words, grep enables users to search files for a particular pattern or word and see any lines that contain it.


Most common flags of grep are:

* -i 	(case-insensitive search)
* -l 	(list only the names of matching files)
* -w 	(which matches whole words only)
* -v 	(invert; this lists displays only the lines that do not match the pattern)
		

  		`grep -r "temp" .` : Searches for the word temp in all the nested files inside the current directory (Case Sensitive)


		`grep -ri "temp" .` : Searches for the word temp in all the nested files inside the current directory (Case Insensitive)





 ### 30.  du
	
Calculates the size of directory as a whole. By default, it measures the current directory and all its subdirectories, printing totals in blocks for each, with a grand total at the bottom.


		`du -m` : Shows the size of directories in megabytes

		`du -g` : Shows the size in gigabytes

		`du -h` : Shows the size in human readable size





**30.  df**
	Calculates the size of mounted file system (how much space they allocate and how much is the free space left). By default, df command shows disk space in Kilobytes (KB) and uses the SI unit suffixes (e.g, M for megabytes, G for gigabytes) for clarity.
 Following are the flags available for df command.
* ‘-a’ or ‘–all’				Includes pseudo, duplicate, and inaccessible file systems in the output.
* ‘-B <SIZE>’ or ‘–block-size=<SIZE>’	Scales sizes by SIZE before printing them.
* ‘-h’ or ‘–human-readable’		Prints sizes in a human-readable format using power of 1024.
* ‘-H’ or ‘–si’				Prints sizes in a human-readable format using power of 1000.
* ‘-i’ or ‘–inodes’			Lists inode information instead of block usage.
* ‘-l’ or ‘–local’			Limits listing to local file systems.
* ‘-P’ or ‘–portability’			Uses POSIX output format for better portability.
* ‘–sync’					Invokes sync before getting usage info.
* ‘–total’				Elides all entries insignificant to available space and produces a grand total.
* ‘-t <TYPE>’ or ‘–type=<TYPE>’		Limits listing to file systems of type TYPE.
* ‘-T’ or ‘–print-type’			Prints file system type

​		 `df -h` *: Shows the size, space etc in human readable size*



**31.  history**
	All the commands previously done are memorized in history. The history built-in command lets you use words from previous command lines in the command line you are typing. This simplifies spelling corrections and the repetition of complicated commands or arguments.
It has the following options: 
* -c		Clear the history list by deleting all of the entries.
* -d offset	Delete the history entry at offset OFFSET.
* -a		Append history lines from this session to the history file.
* -n		Read all history lines not already read from the history file.
* -r		Read the history file and append the contents to the history list.
* -w		Write the current history to the history file and append them to the history list
* -p		Perform history expansion on each ARG and display the result without storing it in the history list.
* -s		Append the ARGs to the history list as a single entry.

​		`history` *: Shows the history of all the previous commands used*

​		`history | grep 'cookie'` *: Shows the history of all the previous commands used with the word cookie*



**32.  ps**
	Display info about currently running processes. You can use it to learn more about what is happening in your system's background processes. Depending on the input parameters, this command may produce different results.

​		`ps` *: Shows the history of all the processes running at the time*

​		`ps ax` *: Shows the history of all the processes initiated by anyone running at the time*

 

**33.  top**
	The top command is used to show the active Linux processes. It provides a dynamic real-time view of the running system. Usually, this command shows the summary information of the system and the list of processes or threads which are currently managed by the Linux kernel.

​		`ps` *: Shows the history of all the processes running at the time*



**34.  kill**
	It receives signals and then react to it: to kill a process. Kill command sends a signal to a process that terminates the process. If the user doesn’t specify any signal which is to be sent along with the kill command, then a default TERM signal is sent that terminates the process.

​		`kill <PID>` *: Kills a process with this process id*

​		`kill -9 <PID>` *: Kills a process with this process id* (Brutally Kill) 



**35.  killall**
	It receives signals and then react to it: to kill a program, can be more processes. Killall sends a signal to all processes running any of the specified commands. If no signal name is specified, SIGTERM is sent. Signals can be specified either by name (e.g. -HUP or -SIGHUP) or by number (e.g. -1) or by option -s.

​		`killall -9 <pname>` *: Kills all the programs with the pname*

	

**37.  gzip**
	Compress a file with gzip compression protocol LZ77 (Lempel Ziv coding)

​		`gzip filename` *: Compress the file and replaces the old file with compressed one*

​		`gzip -k filename` *: Makes a new compressed file with the gz extension*

​		`gzip -d filename.gz` *: Decompresses a file*



**38.  gunzip**
	De-Compress a file (use -k to keep the originals)

​		`gunzip filename.gz` *: Decompresses a file*



**39.  tar**
	Used to archive multiple files into single file (tar -> tape archive)

​		`tar -cf archive.tar file1 file2` *: Creates a new archive file*

​	To unarchive file, use -xf
​		`tar -xf achive.tar` *: Extracts files in the current directory*

​		`tar -xf achive.tar -C directory` *: Extracts files in the specified directory*



**40.  nano**
	Beginner friendly editor - can run directly from your terminal. Easily modify files

​		`nano filename` *: Open file in terminal - can edit easily*



**41.  alias**
	Allows us to define our own aliases. We can give names to commands and use the names in that instance. It only exists in that particular instance/terminal.

​		`alias myls='ls -la'`

​		`myls`= *: This shows the result of ls -la command.*



**42.  xargs**
	The core purpose of xargs command is to take standard input and turn it into list of arguments that other commands who accept.

​		`cat filename.txt | xargs rm` *: Takes arguments from the file with the help of xargs command and passes the output (name of the files) inside the rm command.*



**43.  ln**
	Allows us to create links. Similar to the idea of shortcut on windows. (We can access the programs with the help of shortcuts from our desktop.) Both the files are pointing to the same file. If you make changes in one file, you can see the same changes in the other file.

​		`ln orignalfile.txt hardlink.txt`= *: Outputs the same output as the original file. They are both referring/pointing to the same file in memory.*

* HARD LINK: If you delete the original file, hardlink file will still be there because it is still pointing to the same location in the memory.
		`ln orignalfile.txt hardlink.txt`

* SOFT LINK: If you delete the original file, softlink file will also be deleted. The soft link is pointing to the original file not the location in memory. If original is gone softlink is also gone.
		`ln -s orignalfile.txt softlink.txt`



**44.  who**
	When multiple users are logged in on the same system at the same time, who command displays the users logged into the system.

​		`who`= *: Displays the users logged into the system*



**45.  su**  *(Switch User)*
	The command allows us to switch to another user within the terminal. With exit command you can exit the current user.

​		`su username`= *: Allows to switch user with the help of password.*



**46.  sudo** 
	Sudo is used to run a command as root or with elevated permissions. You must be first enabled to use sudo. You can then run commands as root by entering your password. The permissions are highly configurable.

​		`sudo <command>`



**47.  passwd** 
	This command allows us to change the password of the user.

​		`passwd` *: This will allow us to change password. First it asks the current password and then allows to set new password.*

*To change some other user's password, first you need to have the permission then with sudo you can change password.

​	`sudo passwrd user` *: First you need to enter your own password and then you can change the other user's password only if you have the administration permissions.*



**48.  chown** *(Change ownership)* 
	This command allows us to change the ownership to another user. Owner of a file can do everything with it.

​		`chown <owner> <file>` *: Allows the ownership/permissions of a file to another user.*

​	To change the ownership of all the files and subdirectories nested in a directory, use the flag -R
​		`chown -R <owner> <file>`



**49.  chmod** *(Change mode)* 
	This command allows us to change the permissions of a file or directory.
We need to tell:
* *1) Who are we changing permissions for*
	* *(u - user/owner of file)*
	* *(g - group/member of the group)*					
	* *(o - others)*					
	* *(a - all of the above)*
 * *2) what changes are we making*
   	* *( - (minus sign) removes permission)*
	* *( + (plus sign) grants permission)
	* *( = (equals sign) set a permission and remove others)*
 * *3) which permissions are we setting.*
   	* *(r - read permission)*
   	* *(w - write permission)*
   	* *(x - execute permission)*

*Example:*
	

​						`chmod mode <file>` 

​				`chmod u+x <file>`  *: Grants permission to the user of the file to execute .*

​				`chmod a-x <file>`  *: Removes permission from all (user, group, others) to execute.*

​				`chmod a+w <file>`  *: Grants permission of write to all (user, group, others).*
