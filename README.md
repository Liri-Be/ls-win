# win-ls
ls program for windows written in python and run as batch file.

## ls
ls command returns the list of files and directories in the current directory.  
My additions are -
1. the command also returns the number of files and directories and not only lists them.
2. the command can return data about another directory and not only the current one.  

## My program
The program is the ls command in Linux os, but for use in windows.
The program can get an argument for the directory the user wants to run ls in. If the user does not enter a path the user sets the current directory as the path.

## how to run?
1. clone into this project - 
    ``` 
    git clone https://github.com/Liri-Be/win-ls.git
    ```
2. open the ls.bat file and make sure it looks like this - 
    ```
    path_to_python path_to_ls.py %1
    ```
    %1 is for the argument
4. open the command line in the directory of the project.
5. enter this -
    ```
    ls.bat [path to directory - optional]
    ```

## Files
### ls.py
This file runs through the destination directory and gets all the files and directories in it.

### ls.bat
This file runs the ls.py file from the command line.
