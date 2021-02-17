**Problem**: FieldTrip will not read raw fif files. Gives an error like this:
````Matlab
Undefined function 'fiff_read_epochs' for input arguments of type 'char'.

Error in ft_read_header (line 1911)
        epochs = fiff_read_epochs(filename);

Error in ft_read_header (line 134)
    hdr{i} = ft_read_header(filename{i}, varargin{:});
````
**Cause:** FieldTrip uses low-level MNE-Matlab function to read fif data files. As a default, these are not in any folder that FieldTrip adds to your path when running `ft_defaults`.

**Solution:** Add the MNE functions to your path. Add the following line of code to your scripts at the stage you would call `ft_defaults`.
````Matlab
addpath('~/fieldtrip/fieldtrip/external/mne')
````
Assuming that you have FieldTrip in the folder `/home/your_username/fieldtrip/fieldtrip`; if not, change to wherever you have FieldTrip.