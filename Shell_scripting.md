# MEDS Traniee '25
<p align ="center"><img width=200 height=200 src='/home/nimra/Downloads/Untitled.jpeg'>
</p>

# shell scripting tutorial
## Shell
<div style= "text-align: justify;">A shell is a program that allows you to interact with your computer through a command-line interface . Instead of using a graphical interface like you do with icons and buttons, you type commands into the shell, and it tells the computer what to do. The shell acts as a bridge between you and the operating system, interpreting the commands you give and running them. There are different types of shells, each with its own features, but they all serve the same purpose: to help you control the computer. One common example of a shell is Bash, but there are others like Zsh or Fish.<div/>

## Basic Shell Commands

### 1. `pwd`
The `pwd` command prints the current working directory.

```bash
$ pwd
output
/home/username/current_directroy
```
### 2. `cd` 

The cd command changes the current directory to the specified one.
```bash
$ cd <directroy_name>
```
### 3. `ls`
The ls command lists the files and directories in the specified directory.
```bash
$ ls <directory_name>
```
The -l option provides detailed information about files and directories such as permissions, number of links, owner, group, size, and timestamp.
```bash
$ ls -l
```
The -a option lists all files, including hidden files (those starting with a dot).
```bash
$ ls -a
```
The -l and -a options combined list all files (including hidden ones) with detailed information.
``` bash
$ ls -la
```
### 4. `mkdir` 
The mkdir command creates a new directory with the specified name.
```bash
$ mkdir new_folder
```
### 5. `cp` <source> <destination>

The cp command copies a file or directory from the source to the destination.
```bash

$ cp file.txt /home/user/Documents/
```
### 6. `rm` <file>

The rm command removes (deletes) the specified file.
```bash
$vrm unwanted_file.txt
```
The -i option prompts you for confirmation before deleting each file.
```bash
$ rm -i <file>
```
The -r option removes a directory and its contents recursively.
```bash
rm -r folder_name
```
The -r and -f options together force the removal of a directory and its contents without confirmation.
```bash
rm -rf folder_name
```
### 7. `mv` <source> <destination>

The mv command moves or renames a file or directory.
```bash
$ mv oldfile.txt newfile.txt
```
### 8. `echo` <text>

The echo command prints the given text to the terminal.
```bash
$ echo "Hello, World!"
```
### 9. `touch` <file>

The touch command creates an empty file with the specified name.
```bash
$ touch newfile.txt
```
### 10. `cat` <file>

The cat command displays the contents of the specified file.
```bash
$ cat file.txt
```
