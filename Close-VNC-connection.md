## Close VNC connection (normal)

Type `vncserver –kill :N` to close a server, where `N` is the server's number, e.g. `compute:20` in the picture below.

![VNC](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/remote_connect02.png)

## Close VNC connection (errors)
Sometimes, for some reason, it is not possible to use `vncserver –kill` to shut down the VNC connection. You might get an error like this:

````
user@compute ~]$     /usr/bin/vncserver -kill :6 
Killing Xvnc process ID 20730
Xvnc seems to be deadlocked.  Kill the process manually and then re-run
    /usr/bin/vncserver -kill :6
to clean up the socket files.
````

In that case, you must killer the VNC process manually. To do this find the process id (PID) of the VNC process. You can see the PID by calling `vncserver -list`, which list your active VNC sessions, the session number, and the corresponding PID. To kill the process, write the following in your terminal:

````bash
kill -9 PID
````
Where "PID" is the PID number.