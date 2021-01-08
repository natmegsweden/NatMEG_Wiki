This is a list of errors and bugs that have been encountered on Compute: when and why they appear and the solution to fix or circumvent it.

Please add if you frequenty encounter a bug that is not on the list or if you know the solution to an issue not yet solved.

## Pop-op asking for authetification for update
**Problem**: a pop-op prompt saying "*Authentification is required to set the network proxy used for downloading packages*" keeps appears but require sudo right to continue.

![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/Fig_4-1.png)

This is possibly the same/related error:

![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/Fig_5-1.png)

**Cause**: It seems to be a generic error message, so I have a hard time identifying the problem. I guess that there is an outdated driver somewhere? [@mcvinding]

**Solution**: Problaly that the drivers need to be updated by someone with sudo access. Until then this post tell how to permanently igore the pop-up message: https://unix.stackexchange.com/questions/242423/banish-a-popup-error-message.

## Black screen when starting VNC viewer
**Problem:**

![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/Fig_1-1.png)

**Solution:** [see this page](https://github.com/natmegsweden/NatMEG_Wiki/wiki/VNC-black-screen-error)


