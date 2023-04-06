#!/usr/bin/env bash
<<<<<<< HEAD
<<<<<<< HEAD
# sets up the web servers for the deployment of web_static

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
echo "This is a test" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx start
=======
#Set up my server for deployment
=======
#Install Nginx if it not already installed
blue='\e[1;34m'
<<<<<<< HEAD
brown='\e[0;33m'
green='\e[1;32m'
reset='\033[0m'
>>>>>>> d9d11236db53b74e80fcda3008bdd77ee3678997

echo -e "${blue}Updating and installing ${brown}Nginx${blue}.${reset}\n"

=======
>>>>>>> 3e0cba94aed9d54f630a763e032021ed33cf67e3
# Check if Nginx is installed
if ! command -v nginx &> /dev/null
then
    # Install Nginx if it is not installed
    echo "${blue}Nginx is not installed. Installing...${blue}"
    sudo apt-get update
    sudo apt-get install nginx
    echo -e "${blue}Nginx has been installed.${blue}"
else
    # Print a message if Nginx is already installed
    echo "${blue}Nginx is already installed.${blue}"
fi
# starting nginx service
sudo service nginx start
sudo ufw allow 'Nginx HTTP'


#Create the folder /data/ if it doesn’t already exist
folder="/data/"
# Check if the folder exists
if [ ! -d "$folder" ]; then
    # Create the folder if it does not exist
    echo "${blue}Folder does not exist. Creating folder...${blue}"
    mkdir -p "$folder"
    echo "${blue}Folder has been created.${blue}"
else
    # Print a message if the folder already exists
    echo "${blue}Folder already exists.${blue}"
fi

#Create the folder /data/web_static/ if it doesn’t already exist
folder="/data/web_static/"
# Check if the folder exists
if [ ! -d "$folder" ]; then
    # Create the folder if it does not exist
    echo "${blue}Folder does not exist. Creating folder...${blue}"
    mkdir -p "$folder"
    echo "${blue}Folder has been created.${blue}"
else
    # Print a message if the folder already exists
    echo "${blue}Folder already exists.${blue}"
fi


#Create the folder /data/web_static/releases/ if it doesn’t already exist
folder="/data/web_static/releases/"
# Check if the folder exists
if [ ! -d "$folder" ]; then
    # Create the folder if it does not exist
    echo "${blue}Folder does not exist. Creating folder...${blue}"
    mkdir -p "$folder"
    echo "Folder has been created."
else
    # Print a message if the folder already exists
    echo "${blue}Folder already exists.${blue}"
fi

#Create the folder /data/web_static/shared/ if it doesn’t already exist
folder="/data/web_static/shared/"
# Check if the folder exists
if [ ! -d "$folder" ]; then
    # Create the folder if it does not exist
    echo "${blue}Folder does not exist. Creating folder...${blue}"
    mkdir -p "$folder"
    echo "Folder has been created."
else
    # Print a message if the folder already exists
    echo "${blue}Folder already exists.${blue}"
fi

#Create the folder /data/web_static/releases/test/ if it doesn’t already exist
folder="/data/web_static/releases/test/"
# Check if the folder exists
if [ ! -d "$folder" ]; then
    # Create the folder if it does not exist
    echo "${blue}Folder does not exist. Creating folder...${blue}"
    mkdir -p "$folder"
    echo "Folder has been created."
else
    # Print a message if the folder already exists
    echo "${blue}Folder already exists.${blue}"
fi

#Create a fake HTML file /data/web_static/releases/test/index.html (with simple content, to test your Nginx configuration)
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
echo "${blue}HTML file has been created at $filepath ${blue}"


#Create a symbolic link
source_path="/data/web_static/releases/test/"
target_path="/data/web_static/current"

# Delete the existing symbolic link if it exists
if [ -L "$target_path" ]; then
    rm "$target_path"
fi

# Create the new symbolic link
sudo ln -s "$source_path" "$target_path"

echo "${blue}Symbolic link has been created at $target_path,${blue}"

#Give ownership of the /data/ folder to the ubuntu user
sudo chown -hR ubuntu:ubuntu /data
echo "${blue}Ownership of $target_folder has been changed to $user:$group${blue}"

#Update the Nginx configuration to serve the content of /data/web_static/current/ to hbnb_static
# Set the source and target paths
source_path="/data/web_static/current/"
target_path="/var/www/html/hbnb_static"

# Update the Nginx configuration
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo ln -sf '/etc/nginx/sites-available/default' '/etc/nginx/sites-enabled/default'
# Verify that the configuration file is valid
sudo nginx -t

# Restart Nginx
sudo service nginx restart

<<<<<<< HEAD
>>>>>>> b91de9b7ea5fc2edf18f0a89a93fdb3e3e24172f
=======
echo "${blue}Nginx configuration has been updated to serve $source_path to /hbnb_static${blue}"

>>>>>>> d9d11236db53b74e80fcda3008bdd77ee3678997
