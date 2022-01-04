%% NatMEG wiki - Reverse Normalization of ROIs - Script 1
% this script-series demonstrates how coordinates specified in MNI space can be
% warped to fit participants' native space.
% Obviates the need for normalization procedures that might induce
% distortions and require redundant interpolation.
%
% In this first step, adapted from Mikkel Vinding's script as found under
% https://github.com/mcvinding/warpimg on 06.12.2021, the T1-template is
% warped from MNI space to each subjects MRI. It is assumed that individual
% MRIs are already in neuromag space and resliced.
% This step is done for each participant. 

%% Step 0: load and make a .nii file of the participants neuromag-space MRI
load([Subjects(iSub).folder /'MRI/mri_org_resliced.mat'])

cfg = [];
cfg.filetype    = 'nifti';          % .nii exntension
cfg.parameter   = 'anatomy';
cfg.datatype    = 'double';
cfg.filename    = fullfile([Subjects(iSub,1).folder '/MRI'], 'orig_neuromag_rs');
ft_volumewrite(cfg, mri_org_resliced)

%% Step 1: Make subject tissue probability maps
cfg = [];
cfg.spmmethod   = 'new';
cfg.output      = 'tpm';
cfg.write       = 'no';             % We will not write to disk yet, as it will write each tissue to seperate files.
org_seg = ft_volumesegment(cfg, mri_org_resliced); disp('done')

% Rearrange data stucture for saving
sub_tpm = mri_org_resliced;
sub_tpm.anatomy          = org_seg.gray;
sub_tpm.anatomy(:,:,:,2) = org_seg.white;
sub_tpm.anatomy(:,:,:,3) = org_seg.csf;
sub_tpm.anatomy(:,:,:,4) = org_seg.bone;
sub_tpm.anatomy(:,:,:,5) = org_seg.softtissue;
sub_tpm.anatomy(:,:,:,6) = org_seg.air;
sub_tpm.dim = [org_seg.dim, size(sub_tpm.anatomy, 4)];


%% Step 2: Write TPM volume
cfg = [];
cfg.filetype    = 'nifti';          % .nii exntension
cfg.parameter   = 'anatomy';
cfg.datatype    = 'double';
cfg.filename    = fullfile([Subjects(iSub,1).folder '/MRI'], 'sub_tpm');
ft_volumewrite(cfg, sub_tpm);


%% Step 3.0 - One-Time Only - load template and register it into neuromag space
mri_template=ft_read_mri([MainPath '\spm12\toolbox\OldNorm\T1.nii']);

%For better precision:
cfg = [];
cfg.method      = 'interactive';
cfg.coordsys    = 'neuromag';
mri_template_neuromag = ft_volumerealign(cfg, mri_template);    

save([glbcfg.MainPath '\MEG-Analysis\MEG\mri_template_neuromag.mat'],'mri_template_neuromag')

%% Step 3.1 - load the above and normalize it
load([glbcfg.MainPath '\MEG-Analysis\MEG\mri_template_neuromag.mat'])

cfg = [];
cfg.nonlinear        = 'yes';       % Non-linear warping
cfg.spmmethod        = 'new';       % Note: method="new" uses SPM's default posterior tissue maps unless we specify 'cfg.tpm'.
cfg.spmversion       = 'spm12';     % Default = "spm12"
cfg.templatecoordsys = 'neuromag';  % Coordinate system of the template
cfg.template         = fullfile([Subjects(iSub,1).folder '/MRI'],'orig_neuromag_rs.nii'); % Subject MRI written in Step 0
cfg.tpm              = fullfile([Subjects(iSub,1).folder '/MRI'],'sub_tpm.nii');          % Subject TPM created in step 2
mri_warptmp = ft_volumenormalise(cfg, mri_template_neuromag); % the template in native space, with normalization parameters.
mri_warptmp = ft_determine_units(mri_warptmp);

fprintf('saving...')
save(fullfile([Subjects(iSub,1).folder '/MRI'],'mri_warptmp'), 'mri_warptmp')
disp('done')
