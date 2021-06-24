As a general rule, you should always run MaxFilter on data recorded in the NatMEG lab, as the internal active shielding is always on during recordings due to the large number of magnetic noise generators around the KI campus.

For some applications, it might however be useful to read non-MaxFiltered data, e.g. when testing trigger codes in pilot data. To protect you from running analysis on non-MaxFiltered data, most analysis toolboxes will give you an error if you try to read non-MaxFiltered data.

Here is a guide on how to circumvent the error.

## MNE-Python
In MNE-Python you can read non-MaxFiltered data the same way as you read raw data with `mne.io.read_raw_fif`, with the additional argument `allow_maxshield` set to `False`:

````Python
raw_nomax = mne.io.read_raw_fif("your_filename", allow_maxshield=False)  # Read non-MaxFiltered data
````
For more information see the documentation for [read_raw_fif](https://mne.tools/stable/generated/mne.io.read_raw_fif.html?highlight=read_raw_fif#mne.io.read_raw_fif)

## FieldTrip
You can read non-MaxFiltered data in FieldTrip with the low-level function `ft_read_data`. You have to specify the keyword `'checkmaxfilter'` as `'no'` (the default is `'yes'`, i.e. to ensure that MaxFilter has run).
````Matlab
%% Read data header
hdr = ft_read_header("your_filename", 'checkmaxfilter', 'no');

%% Read raw non-MaxFiltered data
dat = ft_read_data("your_filename", 'checkmaxfilter', 'no');
````

This will, however, read the data as a MATLAB matrix rather than as a FieldTrip data structure that you get when importing data with `ft_preprocessing`. If you are looking for specific channels, e.g. only the trigger channels, it is a good idea to specify that you only want to read the specific channels. Otherwise, it will read all channels no matter what data type it is. For more information see the documentation for [ft_read_data](https://www.fieldtriptoolbox.org/reference/ft_read_data/)
