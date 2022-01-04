%% NatMEG wiki - Reverse Normalization of ROIs - Script 3
% this script-series demonstrates how coordinates specified in MNI space can be
% warped to fit participants' native space.
% Obviates the need for normalization procedures that might induce
% distortions and require redundant interpolation.
%
% In this final step we use the warp parameters from Script 1 and apply
% them to the ROI-grid. This step needs to be done for each participant.

%% load template from Script 2
load([ft_path '/template_grid_ROI_exp.mat'],'template_grid');

%% per subject
% get sensor info and make sure units match
megfiles=dir([Subjects(iSub).folder '/*raw_mc_avgtrans_tsss_corr98.fif' ]);
megfiles=fullfile([megfiles(1,1).folder '/' megfiles(1,1).name]);
grad= ft_read_sens(megfiles);
grad=ft_convert_units(grad,'mm');

%% Step 1: Create Headmodels from warped templates
data_path=[Subjects(iSub,1).folder '/MRI']; % where MRIs and headmodels etc are stored
disp(['Loading mri_warptmp from ' data_path])
load(fullfile(data_path,'mri_warptmp')) %load template that has been warped to native space in Script 1
load(fullfile(data_path,'mri_org_resliced')) %load actual subject MRI 

% Segment the warped template so that we have only the brain
cfg = [];
cfg.output      = 'brain';
cfg.spmmethod   = 'new';
mri_tmp_seg = ft_volumesegment(cfg, mri_warptmp);

% Save (optional)
disp(['Saving mri_tmp_seg.mat to ' data_path])
save(fullfile(data_path, 'mri_tmp_seg.mat'), 'mri_tmp_seg')

% make a mesh from the brain
cfg = [];
cfg.method      = 'projectmesh';
cfg.tissue      = 'brain';
cfg.numvertices = 3000;
mesh_brain_tmp = ft_prepare_mesh(cfg, mri_tmp_seg);

% make a headmodel from the mesh
cfg = [];
cfg.method = 'singleshell';
headmodel_tmp = ft_prepare_headmodel(cfg, mesh_brain_tmp);

% Save headmodel
save(fullfile(data_path, 'headmodel_tmp.mat'), 'headmodel_tmp','mri_tmp_seg','grad')

% now take template grid and create the source model 
cfg = [];
cfg.method          = 'basedonmni';
cfg.nonlinear       = 'yes';
cfg.unit            = 'mm';
cfg.template        = template_grid; % from script 2
cfg.spmversion      = 'spm12';
cfg.spmmethod       = 'new';
% cfg.mri             = mri_org_resliced;
% cfg.headmodel       = headmodel_org;
% sourcemodel_org     = ft_prepare_sourcemodel(cfg);
cfg.inwardshift     = -1.5;
% template
cfg.mri             = mri_warptmp;
cfg.headmodel       = headmodel_tmp;
sourcemodel_tmp = ft_prepare_sourcemodel(cfg);

save(fullfile(data_path, 'sourcemodel_tmp_ROI.mat'), 'sourcemodel_tmp')
% save(fullfile(data_path, 'sourcemodel_org.mat'), 'sourcemodel_org')

%% Inspect - 
figure(iSub);
h1=figure(iSub);set(h1,'Position',[60 40 1600 900])
subplot(1,2,1); hold on; title('Sagittal View')
ft_plot_mesh(sourcemodel_tmp.pos, 'vertexcolor','r','vertexsize',30);
ft_plot_headmodel(headmodel_tmp, 'facealpha',0.1)
ft_plot_sens(grad)
view([1 0 0])
subplot(1,2,2); hold on; title('Frontal View')
ft_plot_mesh(sourcemodel_tmp.pos, 'vertexcolor','r','vertexsize',30);
ft_plot_headmodel(headmodel_tmp, 'facealpha',0.1)
ft_plot_sens(grad)
view([0 1 0])