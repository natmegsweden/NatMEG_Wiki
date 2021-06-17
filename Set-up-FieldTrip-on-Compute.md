To use FieldTrip on Compute you need to download it to your `home` directory yourself. You can do this by direct download from the FieldTrup website (https://www.fieldtriptoolbox.org/download/), but the best way is to clone it directly from their GitHub page (https://github.com/fieldtrip/fieldtrip)

Open a terminal. In your `home `directory, make a folder where you want to download FieldTrip and go to that folder, e.g.:

````bash
mkdir fieldtrip
cd fieldtrip
````
Find the link for the remote repository (on the GitHub page) and clone it. This will pull the entire repository into yout new folder:

````bash
git clone git@github.com:fieldtrip/fieldtrip.git
````

You should now have FieldTrip in your folder. To use FieldTrip, start MATLAB, go to the directory where you just cloned FieldTrip, and run `ft_defaults` in the command window.