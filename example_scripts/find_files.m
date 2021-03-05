function [files] = find_files(folder, inc_str, exc_str)
% Find all files withing a folder with common filename, e.g.
% raw data files from the same condition.
% USE: [files] = find_files(folder, inc_str, exc_str)
% 
% folder  : The folder where the files are located
% inc_str : String that all files have in common (e.g. "taskA")
% exc_str : String that exclude files.

% Init.
if nargin < 1
    error('Must have a filepath')
end

if nargin > 1    
    if ischar(inc_str)
        inc_str = {inc_str};
    elseif ~iscell(inc_str)
        warning('Inclusion string must be a string or cell-array with strings.')
        return
    end
else
    inc_str = [];
end

if nargin >= 3
    if ischar(exc_str)
        exc_str = {exc_str};
    elseif ~iscell(exc_str)
        warning('Exclusion string must be a string, cell-array with strings, or empty.')
        return
    end
else
    exc_str = [];
end
    
% Find files in folder
f = dir(folder);
f = {f.name};
f = f(~(strcmp('.',f)|strcmp('..',f)));     % Remove dots

% Find match
files = f;
for ii = 1:length(inc_str)
    targetstr = inc_str{ii};
    files =  files(~cellfun(@isempty, (strfind(files, targetstr))));
end

for ii = 1:length(exc_str)
    targetstr = exc_str{ii};
    files =  files(cellfun(@isempty, (strfind(files, targetstr))));
end

% Sort for good measure
sort(files);

%END