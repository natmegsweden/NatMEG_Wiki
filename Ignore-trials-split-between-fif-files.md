`%Remove trials from cfg.trl (after ft_definetrial) that have negative sample index for trial start`

`notneg = cfg.trl(:,1) >= 0`

`cfg.trl = cfg.trl(notneg,:)`


`%Remove trials from cfg.trl (after ft_definetrial) that have higher sample index than exist in file`

`toolate = cfg.trl(:,2) < max([cfg.event.sample]);`

`cfg.trl = cfg.trl(toolate,:)`
  
`data = ft_preprocessing(cfg);`
    
`cfg = ft_definetrial(cfg);`