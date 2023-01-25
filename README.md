# Comsc210-2023
Labs and Projects for COMSC210

GitHub Cheat Sheet & Setup Notes - Comsc210

Setup your laptop for development:

VS Code - This is an Integrated Development Environment that includes a code editor, extensions for many languages, and Github support. Download and install VS Code:
https://code.visualstudio.com/Download

Node JS - This is the Javascript compiler that supports open source development. Download and install Node JS:
https://nodejs.org/en/download/

Git - This is a software version control system that is used by Github. Download and install GIT:
https://git-scm.com/downloads

Github - This is a cloud hosted site that is used to manage development projects. Sign up for an account at:
https://github.com

Github Repository for Comsc210 Lab Assignment Code Examples
The example programs for our lab projects are posted in a Github repository
https://github.com/rhodyapps/Comsc210-2023

How to clone a Repository:

Follow these steps to clone a repository:
1. Create a folder called ‘Github’ in your documents folder on your local harddrive. In that folder create another called ‘Comsc210’
2. Open VS Code and click on ‘Terminal’ in the toolbar at the top of the screen
3. In the terminal window type ‘ls’ and then enter key. look for the ‘documents’ folder in the list. 
4. Type ‘cd documents’ and enter key then ‘cd comsc210’ enter key
Now you should see the comsc210 folder name in the command prompt
5. Clone the repo by entering the following command:
git clone https://github.com/rhodyapps/Comsc210-2023

When it finishes, click on the File>Open in the top toolbar and open the folder: comsc210-labs

6. Click on the folder icon in the tool menu on the left and you should see the ‘src’ folder, click on the src folder and you should see all the program examples.

Below are some commonly used Git commands

Git Commands in VS Code terminal

1. Connecting a local project with a Github Repository

If you created a project from scratch, without cloning a Github project:
 - first use git init to establish a local Git repository for this project

git init  

- next create a new repository on Github and copy the url
-  back in VS Code terminal point the project to the Github repository:

git remote add origin <paste in the url to your Github repository>

2. Connecting a cloned repository with your own Github repository

- After you have cloned the repository go into VS Code and run 'npm install' to update project dependencies:

npm install

- Fix or update any dependencies. Run 'npm audit fix' to update the dependencies in the local repository

npm audit fix

- Show the project Fetch and Pull pointers:

git remote show origin

- if the remote origin is not pointing to your Github repo for this project, first remove the pointer::

git remote rm origin

- then go into your Github and get the url for the repository that you want to use for this project (create a new repository if necessary). Copy the url to the Github repository. Then in VS Code:

- git remote add origin <paste in the url>


3. Add your new project to Github Desktop

- Go into Github Desktop and click 'Add existing repository'
- click on the 'choose path' to navigate to the local repository for the project you want to add.

4. How to merge a branch into the master branch (or another branch)

- Merging begins with creating a 'Pull Request' 
- First push all your changes for the branch you want to merge to Github.
- Then in Github select the branch that you want to merge and click on 'create pull request'


