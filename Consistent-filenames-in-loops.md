Consistent filenames are key to data management. If you name your output files manually every time you save a file, you risk making errors. Do not rename files each time you run the analysis. Use a consistent way to read what subject, session, and processing step the data belongs to.

In the top of a script (or better in a separate `config` script that you run at the beginning of every other script), you specify the base string of the filename. E.g.:
````Matlab
%% Base file names
raw_fstring = '-raw-tsss.fif';          % The raw data
ds_fstring  = '-raw-downsampled.mat';   % Downsampled and cleaned raw data
epo_fstring = '-epochs.mat';            % Epoched data
````
... and so on.

Then in the loop/function where you run the data processing, you specify the subject-specific input- and output filenames. This is an example of how to do in a Matlab loop:
````Matlab
%% Run loop...
for ss = 1:length(all_subjects)
   subj = all_subjects{ss};

   % Define filenames
   infname  = fullfile(my_data_path, subject_folder_path, [subj, ds_fstring]);    % Read '-raw-downsampled.mat'
   outfname = fullfile(my_data_path, subject_folder_path, [subj, epo_fstring]);   % Save '-epochs.mat'

   % Load data
   load(infname)

   % Run your process
   ...

   % Save
   save(outfname, mydata)
end
````
Example with multiple sessions and subjects:
````Matlab
%% Run loop...
for ss = 1:length(all_subjects)
   for jj = 1:length(all_sessions)

      subj = all_subjects{ss};
      session = all_sessions{jj}

      % Define filenames
      infname  = fullfile(my_data_path, subject_folder_path, [subj,'-',session, ds_fstring]);    % Read '-raw-downsampled.mat'
      outfname = fullfile(my_data_path, subject_folder_path, [subj,'-',session, epo_fstring]);   % Save '-epochs.mat'

      % Load data
      load(infname)

      % Run your process
      ...

      % Save
      save(outfname, mydata)
   end
end
````