*Problem*: the layout of the sensors is wrong. When plotting the position, they appear scrambled.

Plot the channel positions:

````matlab
plot3(data.grad.chanpos(:,1), data.grad.chanpos(:,2), data.grad.chanpos(:,3), 'o')
````
![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/sensors_on_drugs.png)

How it should look:

![](https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/sensors_plot.png)

Also, you cannot plot the sensor layout with `ft_plot_sens(data.grad)`:
````
Error using ft_plot_sens (line 448)
cannot work with balanced gradiometer definition
````
*WARNING*: If you have this error, it is potentially a big problem if you are doing source reconstruction, as the geometry of the sensors relative to the brain is wrong (see the figures above again!). This another reason, why you should always [plot the alignment](https://github.com/natmegsweden/NatMEG_Wiki/wiki/Plot-head-channel-alignment-in-FieldTrip) of headpoints, the headmodel, and sensors before doing source reconstruction.

The problem comes from the reconstruction of the channels when removing ICA components (`ft_rejectcomponent`). 

### Solution
When using `ft_rejectcomponent` make sure that you specify input data and set the configuration to NOT update sensor info:

````matlab
% Remove components
cfg = [];
cfg.component   = reject_comp;
cfg.channel     = 'MEG';
cfg.updatesens  = 'no';
icaclean_data = ft_rejectcomponent(cfg, comp, data);
````
