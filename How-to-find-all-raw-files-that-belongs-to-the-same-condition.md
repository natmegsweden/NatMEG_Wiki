For example, if you have split files called "taskA.fif" and "taskA-1.fif" that not necessarily is equal between subjects, but want to read all files with the name "taskA" in the filename.

Use this function: https://github.com/natmegsweden/NatMEG_Wiki/blob/main/example_scripts/find_files.m

Copy/paste it to your file path and then use it like this: 

````matlab
% Find files
subpath = '/some/path/with/all/data'   % Replace with real data path
file_list = find_file(subpath, {'taskA', 'tsss'}) % Find all files with "taskA" and "tsss" in the filename

% Load the data (one way to do it)
for ff = 1:file_list
   data{ff} = load(file_list{ff})
end
````