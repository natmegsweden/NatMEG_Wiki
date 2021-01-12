`cfg                     = [];   `
`cfg.dataset             = full_path`
`cfg.trialdef.prestim    = 0.35`
`cfg.trialdef.poststim   = 0.3`
`cfg.trialdef.eventvalue = events`
`cfg.trialfun            = 'ft_trialfun_neuromagSTI016fix';`
`cfg                     = ft_definetrial(cfg);`

`**%Remove trials from cfg.trl that have negative sample index for trial start**`
`**notneg = cfg.trl(:,1) >= 0**`
`**cfg.trl = cfg.trl(notneg,:)**`
  
`**%Remove trials from cfg.trl that have higher sample index than exist in file**`
`**toolate = cfg.trl(:,2) < max([cfg.event.sample]);**`
`**cfg.trl = cfg.trl(toolate,:)**`

`data = ft_preprocessing(cfg);`

`cfg = ft_definetrial(cfg);`
    
`%Preprocess`
`cfg.demean = 'no';`
`cfg.lpfilter = 'no';`
`cfg.hpfilter = 'no';`
`cfg.dftfilter = 'no';`
`cfg.channel = 'MEG';`

`split_files_MEG{filename_index} = ft_preprocessing(cfg);`