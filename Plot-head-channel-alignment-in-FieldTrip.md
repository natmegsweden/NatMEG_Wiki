Recommendation: always plot the head models together with the head points and sensors as a sanity check that the process went well.

Easy code snippet you can copy paste to your script:

````matlab
%% Plot all aligned: MEG
figure; hold on
ft_plot_sens(grad)
ft_plot_headshape(headshape)
ft_plot_headmodel(headmodel)
ft_plot_axes([], 'unit', 'cm');
````

![](https://github.com/natmegsweden/meeg_course/blob/master/figures/meg_check.jpg)