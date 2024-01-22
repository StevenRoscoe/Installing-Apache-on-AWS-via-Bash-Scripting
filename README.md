# Installing-Apache-on-AWS-via-Bash-Scripting


<h2>Description</h2>
Your company wants to start shifting from using on-premises servers to using servers in the cloud. Rather than purchasing all the infrastructure in a data center they ask you to create an EC2 instance in AWS to host their new website:
</br>


<h2>Languages and Utilities Used</h2>

- <b>Bash</b> 
- <b>Command Line</b> (Windows)

<h2>Environments Used </h2>

- <b>Amazon Web Services</b> 
- <b>Amazon Linux 2 VM</b>

<h2>Project walk-through:</h2>

Starting off, select the EC2 service in the search bar at the top:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*GqhQzoKMcG7GAkgTZEiWYg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Select Launch instance:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*cHQJuzdMu5wVB1RU1dOEVQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Name your instance:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*dCYzLow9gEnyxDxmJvOakA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

We will be using an Amazon Linux 2 instance since it is free-tier eligible:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*fbsVrLIWEAC09ivN5KjF9A.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

This will be a t2.micro instance as it is also free-tier eligible and we don’t need much memory for this project:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*HX8V4dmKQjo4tfML3J5AXA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

AWS recommends you create a key pair to remote into your instance, allowing only you to have access to it. Since I am using a Windows computer, I will select the RSA pair-type and use the .pem format for OpenSSH. Create the key-pair and proceed:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*4E5SJj6iqcuR29-RteIpjQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

We want to edit some information in our network settings. Enable auto-assign to have AWS give you a random IP address to SSH into your instance. Create a new security group:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*T6kFuWUIhWUjUjZdw_-O8g.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

For project purposes only, we want to set the security group rule for HTTP to anywhere, granting public access to our webpage. Take note of the message at the bottom. Never do this in a job setting! For the SSH type, set it to your own IP, as this will give you remote access:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*j3H4mWNiwaBsNaTtoJCyHg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now launch your instance, and head over to the instances pane to look at your instances start up. You will know it’s ready when the status checks have reached 2/2 and it in the “running” state. Highlight your instance and click on the Connect button:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*wUqlkXg8p3fFzW9jh0n9_g.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

On the SSH client, they have given us the command needed to remote into our instance. Copy the command and head over to your command line:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*e19ig5B344omO865u7bvbQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now let’s change the directories to where our .pem file is located. My file would be in the Downloads directory:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*D0UqLoqye4_T-0QhfoKnJg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Paste the command copied earlier and choose yes for the fingerprint, then you’re in:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*aw2EmfaabvfqPef8q6BO4g.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now that I’m in my instance, I want to install Apache and create a custom HTML webpage using a Bash script. Type in the following command:

<b>vim custom-apache.sh </b> 

This brings up the VIM text editor and allows us to create the script:

<b>⚠This script can be found in the repository "Installing-Apache-on-AWS-via-Bash-Scripting"⚠ </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*THfPmpTHSgpPlze_s2jYwA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Save and quit out of the script. Now we’ll need to make the file executable so we can run it in the instance. Type in the following command:

<b>chmod +x custom-apache.sh </b>

Now run the script with the following command:

<b>sudo ./custom-apache.sh </b>

Now copy and paste the public IP address from the EC2 instance into the URL search bar:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*NamMrLMExLDbFWKuSymWWg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

This completes the project. If done, please go back and delete the instance so you won’t incur a charge. Continue for a more advanced version of this:


<h2>🔥ADVANCED🔥 </h2>

I decided to exit my instance so I can SSH back into it. This will give me a new IP address:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*KB5mMdyk2bzDtT5o4UH0Jw.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Let’s SSH through our command line again, change directories to the Downloads folder, and enter in our command. Now let’s check the contents of the current directory for our EC2 instance:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*E5dnNRAZAEoyFWB6NRwIhA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

We have our script for our custom webpage. For starters, let’s make a directory titled "scripts":

<b>mkdir <name_of_directory> </b>

<b>mkdir scripts </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*D8OtwS69SWvOQ1LWnMKqEg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Then we want to move that script into our scripts directory:

<b>mv <name_of_script> <name_of_chosen_directory> </b>

<b>mv custom-apache.sh scripts </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*6VYqjfysoT9tUu8u3Xdt1Q.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

For this part of the project you are required to make a GitHub repo for your Bash scripts. Follow the images below:

Create new repo:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*yRt6PfS2ukzFDAmo8dVlwA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Come up with a repo name, make it public, and add a readme file:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*hstG408RtuwSbNsSe0mIdQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

I previously had one made as I’ve been working on scripts before, but your repo will be empty:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*iptu4gXTbelYSwmPSM3U_A.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now let’s install and configure Git on our EC2 instance:

<b>sudo yum install git -y </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*AzXxyXrAx8WTX4OElCSnSQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

<b>git config --global user.name <username> </b>

<b>git config --global user.email <email_address> </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*hHOMr8-1q8_9RFpiheZxOg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

In your GitHub copy the link from the green Code drop-down button for HTTPS:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*FMMMeyCOnFK3ITB_GlDCeQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Clone your git repo with the following command:

<b>git clone <HTTPS_URL_link> </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*tO28AZ4NT8fHs5QQL0DrqA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Looking in our directory we now have our cloned repo:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*zQ31ZgMcYvX2PixDj0wnkA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

From here, let’s move our scripts directory into our cloned repo with the following command:

<b>mv scripts BASH-Scripts/ </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*JHNp1_kBH-769kl-aagqRQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now we add the scripts directory to our repo and check the status:

<b>git add scripts/ </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*X2EQokrjMHvyGNXVFChnvg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

The file is ready, so we can now commit the file and get ready to push it to GitHub:

<b>git commit -a -m “<comment_for_commit>” </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*ip3CQrUT5jxDLh0_FGpTNQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Push the file to GitHub using the following command:

<b>git push https://GITHUB_ACCESS_TOKEN@github.com/StevenRoscoe/BASH-Scripts.git </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*lcYKqyWJwx0nlfqOi6auRg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

After pushing it, you should see your new scripts folder inside of your repository on Git:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*DXru2M3GxEZGhfrxgTiVNQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />


<h2>☠COMPLEX☠ </h2>

Let’s look inside of our Bash Scripts repo:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*e0qMX5pxUpmSQNMlP_-8wA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Change into your scripts directory and create a script to add a new user. The name of the script will be add-user.sh. Type in the command: 

<b>⚠This script can be found in the repository "Installing-Apache-on-AWS-via-Bash-Scripting"⚠ </b>

<b>vim add-user.sh </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*JUBp5eCQmS8eTCKD2ivouA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Save and quit the file, then make the file executable:

<b>chmod +x add-user.sh </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*CLZSKqDKl2cfVEloMZrCAw.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now we run the script:

<b>./add-user.sh </b>

The script will ask for the input of a new password for the user steve123. Enter in the password and the new user account is now created:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*k_7idFwnRH-R_5WyWWXyxA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

To be able to log into this account, we will have to change some settings in the ssh_config files. To do this, change into the root user of the account:

<b>sudo su </b>

Then type in the following command to make the changes:

<b>vim /etc/ssh/sshd_config </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*grLmJ5eRdlrpGagrBlFWGQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

This will take you to the ssh configuration file. Scroll down until you see "PasswordAuthentication". Delete the hashtag for yes and put in a hashtag for no to PasswordAuthentication:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*vriymAcFbbVmxcjrTn-CUA.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Save and quit the file then restart the instance for it to take effect. Now remote into the instance once more with the following command found on the connect page for your instance:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*0R-yrr38c_zfaOYvC8eAzg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

<b>ssh <created_username>@<ec2_ip_address>.compute-1.amazonaws.com </b>

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*S2R3IAGnlF5YX7erhWucoQ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

Now that we see our script works, let’s push it to GitHub. Follow the steps below, and refer to the commands to commit and push your code:

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*KY8Vjk0uJ7xMOVuEWOSTyw.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*8ZjjTsf2k9ooaQk41mNAWg.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

<p align="center">
<br/>
<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*eFiotL1mC96x157FcBuz7A.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

And that completes the project, job well done!
