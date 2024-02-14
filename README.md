# Petites Automatisations

## What is it?

This repository contains Bash scripts that automate generic or data tasks that might be tedious, repetitive, or time-consuming. 

## Why?

To free up time for other relevant or complex tasks. 

## What are the contents? 

* **git-pull-all.sh:** a Bash script that performs an automatic ```git pull``` in all the sub-directories below a main work directory, avoiding the repetition of commands or ```git pull``` inside each and every Git folder;

* **convert_csv_into_sql.sh:** a Bash script that converts a .csv file into a raw .sql script with ```INSERT INTO``` for each row of the table; please note that this conversion will be useful in smaller or medium-sized .csv files and it might be necessary to make further adjustments in the .sql file, according to the relational table and database syntax; 

* **rename_files_inside_directory.sh:** a Bash script that renames files inside the folder and sub-folders according to a given pattern provided by the user: ```./rename_files_inside_directory.sh <directory> <search_pattern> <replace_pattern>```, e.g. ```./rename_files_inside_directory.sh . old_name_to_be_changed new_name_to_be_included```.

## How to run the scripts?

Follow the instructions above and run each script according to your convenience inside the appropriate folder, using ```./name_script.sh```.

Remember to give the necessary permissions to the script file using the ```chmod``` command.

## What is the tech stack?

The stack comprises:

* Linux or MacOS or Windows Subsystem for Linux (WSL)
* Bourne Again Shell (Bash)
