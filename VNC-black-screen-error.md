You might experience a black screen with an error message when you first log in to a new VNC server.

![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/Fig_1-1.png)

![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/Fig_2-1.png)

The error seems to be due to Anaconda/Python initiation, which messes with the VNC config in some way. I have not been able to solve the problem definitly [if you know, please tell me! @mcvinding], but the following procedure circumvents the problem:

Open PuTTy to connect to Compute as [usual](https://github.com/natmegsweden/NatMEG_Wiki/wiki/Connect-to-Compute). Then in the terminal, before you open your VNC viewer, you have to uncomment all reference to Anaconda in your local `.bashrc` file (these are the setting that you load every time you start a terminal). You can see the content of the file by typing `cat .bashrc` in the terminal.

To edit the file:
1. Type `vim .bashrc`. 
2. Type `i` to enter edit mode.
3. Comment all lines that have to do with Anaconda by placing a `#` in front of the line. Do not delete the lines.
4. Press `Esc` to exit edit mode and then type `:wq!` to exit.

You should now be able to open the VNC viewer. If not, try to kill the VNC server (`vncserver -kill :X` where `X` is your VNC number) and start a new vncserver.

Once you have opened the VNC viewer, you can edit the `.bashrc` file again (e.g. with `gedit`) and uncomment the lines you commented above. Then you will have Anaconda back again when you start a new terminal. And for some strange reason, Anaconda and the VNC server will keep working from that point on.