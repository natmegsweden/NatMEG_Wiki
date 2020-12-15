Sometimes data recordings are split into several files, wither because the recording was started and stopped during data acquisition, or because the 2 GB maximum file size of FIF means that long recording sessions are split over several files. When you read data into FieldTrip, you then need to merge the split files into one data file for further processing and correct the samples so that the files align. There are several ways you can achieve this.

## A) Read all files, concatenate, and then create trials
Manually correct sample info by reading the header and events with `ft_read_header` and `ft_read_event`. 

First, specify the filenames:

````matlab
infiles = {
    fullfile(raw_path,'data_tsss_mc.fif'),
    fullfile(raw_path,'fata-1_tsss_mc.fif')
    };
````

Then read events and headers. This code assumes that the trigger channel is `STI101`.

````Matlab
%% Read events
for ii = 1:length(infiles)
    hdrs{ii} = ft_read_header(infiles{ii});
    idx = find(not(cellfun('isempty',strfind(hdrs{ii}.label,'STI101'))));
    eve{ii} = ft_read_event(infiles{ii},'chanindx',idx);
end
````

No correct the sample value by adding the number of samples in the previous file to the sample index of the next file.

````matlab
sam1 = [eve{1}.sample]; 
sam2 = [eve{2}.sample]+hdrs{1}.nSamples;
allsam = [sam1, sam2];
eve2 = appendstruct(eve{1}, eve{2});
````

Plot to see that it align, as it should.

````matlab
figure; hold on
plot(allsam, [eve2.value], 'k');
scatter(allsam, [eve2.value], 'r')
````

In the next step, I did the selection based on the trigger values in the different conditions, like this: `rsp_taskA = [eve2.value] == 2`. I did this for all the different conditions; in this case, three different conditions.

Then create the `trl` structure manually. Specify how much time you would like before (`prestim`) and after (`poststim`). In contrast, to `ft_define_trial`, this should be specified in *number of samples* rather than seconds.

````matlab
sam_taskA = allsam(rsp_taskA);
sam_taskB = allsam(rsp_taskB);
sam_taskC = allsam(rsp_taskC);
sam_cmb = [sam_taskA, sam_taskB, sam_taskC]'; 		% Merge trigger samples
con_cmb = ones(size(rsp_taskA)),ones(size(rsp_taskB))*2,ones(size(rsp_taskC))*3]'; 	% Create label for conditions for bookkeeping.

% Create the trial structure.
prestim = -1000; 		% -1000 samples
poststim = 1000; 		% +1000 samples
trl = [sam_cmb+prestim, sam_cmb+poststim, repmat(prestim,size(sam_cmb)), con_cmb];
````

Then you can read in the MEG data split-files as usual and do whatever initial pre-processing you want to do with `ft_preprocessing`. Then use `ft_redefinetrial` to chop into epochs based on your previously defined `trl` structure.

```Matlab
%% Read all datafiles
for ii = 1:length(infiles)
    cfg = [];
    cfg.channel         = 'MEG';
    cfg.dataset         = infiles{ii};
    split_meg{ii} = ft_preprocessing(cfg);
end

%% Merge split files
cfg = [];
cfg.keepsampleinfo='no';
raw_meg = ft_appenddata(cfg,split_meg{:});

%% Make epochs
cfg = [];
cfg.trl = trl;
epo_meg = ft_redefinetrial(cfg, raw_meg);
```


## B) Make epochs immediately, then merge split files

* add...

