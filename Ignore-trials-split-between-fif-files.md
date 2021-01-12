````Matlab
% Define trials
cfg                     = [];   
cfg.dataset             = %
cfg.trialdef.prestim    = %
cfg.trialdef.poststim   = %
cfg.trialdef.eventvalue = %
cfg.trialfun            = %
cfg                     = ft_definetrial(cfg);

%Remove trials from cfg.trl that have negative sample index for trial start
notneg = cfg.trl(:,1) >= 0
cfg.trl = cfg.trl(notneg,:)
  
%Remove trials from cfg.trl that have higher sample index than exist in file
toolate = cfg.trl(:,2) < max([cfg.event.sample]);
cfg.trl = cfg.trl(toolate,:)

% Preprocess
cfg.channel = %

data = ft_preprocessing(cfg);
````