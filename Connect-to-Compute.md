This is a guide on how to connect to NatMEG's Compute server for data analysis. To connect, you need a username and password for the server.

Connecting to Compute has three steps:

1. Connect to KI's network (if working by remote)
2. Connect to compute with username and password.
3. Open VNC window

The first time you connect you need to start a VNC server and configure your settings. The guide below explains the steps in detail.

## Connect to NatMEG’s servers from outside KI's network
To connect to the NatMEG servers, you need to be on KI’s network. If you are working on KI you can go to step 2: *Connect to Compute with VNC*. If not, you first need to set up a VPN connection to KI.

To remote connect to KI's network, you need to have a KI account and username and then connect via KI's VPN service and the PointSharp app.

If you do not have a VPN connection to KI, you need to set this up first. This includes downloading a VPN app Cisco Anyconnect and a verification app PointSharp. If you do not have the PointSharp app already, you need to contact KI's IT support (fixit@ki.se) to get a verification code the first time you connect. You can find the official guide here: https://staff.ki.se/vpn-service.

When you are on KI's network—either by remote or physically present at KI—you can connect to Compute.

## Establish a connection to Compute
If you have not connected to Compute before, you will need to do an initial setup to create the VNC server. First, you need an **SSH client** (e.g. PuTTy if on PC www.putty.org) and a **VNC client** (e.g. SSVNC, https://sourceforge.net/projects/ssvnc/files/ssvnc/1.0.29 or TightVNC Viewer, www.tightvnc.com/download.php).

Once you have this in place, you can connect to compute and create a VNC session.

Follow this procedure to set up the VNC connection to Compute:

Open PuTTy. On the main tab enter “Host Name (or IP address)” as `compute.natmeg.se` or `130.229.40.51`. Use port `22` (typically the default), as shown below:

![PuTTy](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/remote_connect01.png)

Click open. A terminal will pop up. Enter your username and password. You are now connected to Compute.

## Create a new VNC session
When connected to “compute”, you must create a new VNC session (not to confuse with VPN). You do this in the terminal:
a. Type: `vncserver –geometry 2560x1340`. Choose a geometry, i.e. screen resolution, that works with your own monitor.
b. Note the session number you get in return and use this to connect to your VNC session later.

![VNC](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/remote_connect02.png)

c. Type `vncserver –list` to see your active VNC sessions. Type `vncserver –kill :N` to close a server, where `N` is the server's number, e.g. `compute:20` in the picture above. For example, if you want to change the geometry of the window later on.

### Configure connection for future conncection.
Open a new PuTTY. Go to the tab  Connection -> SSH -> Tunnels. Add “Source port” as `59XX` where XX is the number of your VNC server, e.g. 5907. Add “Destination” as `localhost:59XX` where XX is the number of your VNC server (see picture below). Click “Add”.

![PuTTy](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/remote_connect03.png)
 
Go to the tab Connection -> SSH -> X11. Make sure “Enable X11 forwarding” is checked. Add “X display location” `localhost:0`.
 
![PuTTy](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/remote_connect04.png)

Before proceeding, go back to the first tab and save the settings.

Next, open the VNC client. If you set X11 forwarding, as described above, connect to “Remote Host” `localhost:0`. If not, connect using your username + the IP address to compute (130.229.40.51) + an index (59) + your VNC session id. (If you get a one-digit VNC id back, e.g. 2, your id is 02 (so you get `:5902`).

![VNC](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/remote_connect05.png)
 
The first time you connect to your VNC session on compute, you will be prompted for an extra security password. Create a secure password that you can remember. You will use the password every time you open the VNC window.

You now have a remote window connected to compute.

> If you experience a black screen with an error when you connect, see [here](https://github.com/natmegsweden/NatMEG_Wiki/wiki/VNC-black-screen-error).

## Connect to compute with VNC
Once the setup is complete, you connect to the servers like this:
1. Open PuTTy. If you saved the settings (as instructed above), click “Open”. Then enter your username and password. 
2. When connected to the server, open your VNC viewer. Then enter your username and password.

