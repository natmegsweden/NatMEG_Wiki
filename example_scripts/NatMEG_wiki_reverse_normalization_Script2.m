%% NatMEG wiki - Reverse Normalization of ROIs - Script 2
% this script-series demonstrates how coordinates specified in MNI space can be
% warped to fit participants' native space.
% Obviates the need for normalization procedures that might induce
% distortions and require redundant interpolation.
%
% In this second step we specify the ROIs and make the grid that will be
% warped to subjects' native space in Script 3. This step only needs to be
% done once.

%% STEP A: Make template - only required once
% first specify MNI coordinates for your ROIs, e.g.:
ROI_MNI=[-20 10 11; 32 25 23; -15 -40 -50];

%% if desired, we can build a sphere around each of these coordinates
radius = 3; % how many coordinate points should we include in the sphere (radius=3 will lead to 122 additional coordinate points per ROI)

% initialize the new 'expanded' ROI variable
ROI_MNI_exp=[];
ROI_MNI_exp_clust=[];

% make a template sphere
m = 100; n = 100; p=100;
[px,py,pz] = meshgrid(1:n, 1:m, 1:p);

logicalSphere = (px-50).^2 + (py-50).^2 + (pz-50).^2 <=radius*radius;
X = zeros(m,n,p);
X(logicalSphere) = 1; 
ind = find(X);
[i1, i2, i3] = ind2sub(size(X), ind);

% centre the sphere to a 0-point
i1=i1-50;
i2=i2-50;
i3=i3-50;

% place sphere around each of our ROIs
for iRoi=1:length(ROI_MNI)
 ROI_sphere=[i1+ROI_MNI(iRoi,1), i2+ROI_MNI(iRoi,2), i3+ROI_MNI(iRoi,3)]; %add sphere around each ROI
 ROI_MNI_exp=[ROI_MNI_exp;ROI_sphere]; % append ROI-spheres
 ROI_MNI_exp_clust(length(ROI_sphere)*(iRoi-1)+1:length(ROI_sphere)*iRoi)=deal(iRoi); %Keep track of which ROI each entry belongs to 
end

%% Now put together the ROI-sources in mni space
ft_path='Z:\fieldtrip';

template = ft_read_mri(fullfile(ft_path, '/external/spm8/templates/T1.nii'));
template.coordsys = 'mni'; 
cfg          = [];
template_seg = ft_volumesegment(cfg, template);
cfg          = [];
cfg.method   = 'singleshell';
template_headmodel = ft_prepare_headmodel(cfg, template_seg);
template_headmodel = ft_convert_units(template_headmodel, 'mm'); % Convert the vol to cm, because the CTF convenction is to express everything in cm.

cfg              = [];
cfg.method       = 'basedonpos';
cfg.sourcemodel.pos=ROI_MNI_exp; % note if you don't want spheres, just place ROI_MNI here
cfg.inwardshift  = -1.5; % this can be adjusted, if some points of your spheres/ROIs fall outside the brain template (see message below)
cfg.headmodel    = template_headmodel;
template_grid    = ft_prepare_sourcemodel(cfg);

disp(['A total of ' num2str(sum(template_grid.inside)) ' per ' num2str(length(template_grid.inside)) ' Sources are inside'])

%% save template
save([ft_path '/template_grid_ROI_exp.mat'],'template_grid','template_headmodel');

%% inspect result
close all;
figure(1)
h1=figure(1);set(h1,'Position',[60 40 1600 900])
subplot(1,2,1); hold on; title('Sagittal View')
ft_plot_mesh(template_grid.pos, 'vertexcolor','r','vertexsize',30);
ft_plot_headmodel(template_headmodel, 'facealpha',0.1)
view([1 0 0])
subplot(1,2,2); hold on; title('Frontal View')
ft_plot_mesh(template_grid.pos, 'vertexcolor','r','vertexsize',30);
ft_plot_headmodel(template_headmodel, 'facealpha',0.1)
view([0 1 0])


