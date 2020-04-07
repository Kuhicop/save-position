# THIS IS A REMAKE OF https://forum.cfx.re/t/release-save-respawn-the-last-player-position-with-mysql/15523/126
His script sadly did not work on my server, so I decided to rewrite it.
Thanks for your effort for the script back in 2017 though.



# save-position
FiveM Script for saving player positions in a MySQL database. 


# Installation
Download the repository.
You will find __4__ Files.
Create a folder in your resources called 'save-position' (Not tested with other names, change on your own risk)
Copy the downloaded files into your server folder.
Add 'start save-position' to your server config
# !<>! Make sure you start the script AFTER fivem-mysql-async !<>! (https://github.com/brouznouf/fivem-mysql-async)
Enjoy.

# Usage
The script works as soon as a player connects.

# Configuring
Currently it is only supporting automatic saving, if you want to change the interval go to:
'save-position/client.lua'- line : 11
Change the 10000 to anything you want - the time is described in milliseconds.


