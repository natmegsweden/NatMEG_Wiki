Select a subsample of trials from a dataset. E.g. if you ant to test the number of trials needed to see a response in pilot data, or compare first vs last trials.

In this example, I select the number of trials in steps of 10 to 100 in a loop. There are three examples:
1. Select the N first trials.
2. Select the N last trials.
3. Select N trials at random (to avoid bias).

I start with cleaned and downsampled data; all preprocessing is already done on this data.

````Matlab
%% Number of trials in data
nTrials = length(cleaned_downsampled_data.trial); % is 100 in this example

%% Select in steps
ii=0; %
for nn = 10:10:nTrials 
    ii = ii+1;
 
    % A: select nn first trials
    cfg = [];
    cfg.trials = 1:nn;
    dat_nFirst{ii} = ft_selectdata(cfg, cleaned_downsampled_data);
    
    % B: select nn last trials
    cfg = [];
    cfg.trials = nTrials-nn:nTrials;
    dat_nLast{ii} = ft_selectdata(cfg, cleaned_downsampled_data);
    
    % C: Select nn random trials
    idx = zeros(nTrials, 1);
    idx(1:nn) = 1;
    idx = logical(idx(randperm(length(idx))));
    
    cfg = [];
    cfg.trials = idx;
    dat_nRand{ii} = ft_selectdata(cfg, cleaned_downsampled_data);
    
end
````

Then average to get evoked responses. Here I only run on the data with N first trials, but you can do the same for the other ways of selecting trials.

````Matlab
%% Average
for ii = 1:length(dat_nFirst)
    cfg = [];
    dat_nFirst_avg{ii} = ft_timelockanalysis(cfg, dat_nFirst{ii});
end
````

Finally plot for comparison.

````Matlab
%% Plot for comparison
cfg = [];
cfg.layout = 'neuromag306mag.lay';
ft_multiplotER(cfg, dat_nRand{:})
legend(strsplit(num2str(10:10:nTrials)))
````

