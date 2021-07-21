An example of how to use `uiwait()` in a loop to inspect some summary figure per subject. Mind that `load()` may be slow with large files.


    for i = 1:length(sub_date.ID);
    
        %from ft_read_headshape(MEGfile);
        load(['../mat_data/MRI_mat/' 'ID' sub_date.ID{i} '_headshape']);
    
        %from ft_read_sens(MEGfile);
        load(['../mat_data/MRI_mat/' 'ID' sub_date.ID{i} '_sensshape']);
    
        %from ft_prepare_headmodel(cfg, mesh_brain);
        load(['../mat_data/MRI_mat/' 'ID' sub_date.ID{i} '_MEG_headmodel']);
    
        %Final plot - aligned MEG
        fig = figure('Position', [800 300 900 900]); %[Left Bottom Width Height]
        hold on;
        ft_plot_sens(sensshape)
        ft_plot_headshape(headshape)
        ft_plot_headmodel(headmodel_meg)
        ft_plot_axes([], 'unit', 'cm');
    
        title(['SUBJECT: ' sub_date.ID{i}]);
    
        %Pause loop until figure is closed
        uiwait(fig);

    end