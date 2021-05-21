After processing raw data with MaxFilter it will append various string to the filenames. This is a short guide to understand what the strings mean. Each string note a process that has been applied to the data: 

* "*sss*": processed with Signal Space Separation.
* "*tsss*": processed with Temporal Signal Space Separation.
* "*mc*": applied movement correction.
* "*ds*": data is downsampled.
* "*quat*": quaternion; it has estimated the head movement but not done movement correction (this is represented in quaternion format).