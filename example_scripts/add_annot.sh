export SUBJECTS_DIR=/home/mikkel/PD_motor/fs_subjects_dir

# Define subjects
sub_list=( 0313 0322 0332 0342 0355 0363 0371 0376 0392 0399 0314 0325 0333 0343 0360 0364 0373 0377 0393 0403 0319 0327 0339 0352 0361 0366 0374 0386 0397 0406 0320 0328 0340 0353 0362 0367 0375 0389 0398 )

# Loop through subjects to create annot files: HCP combined
for SUB in ${sub_list[*]}; do
	# LH
	mri_surf2surf --srcsubject fsaverage --trgsubject $SUB --hemi lh \
	--sval-annot $SUBJECTS_DIR/fsaverage/label/lh.HCPMMP1_combined.annot \
	--tval       $SUBJECTS_DIR/$SUB/label/lh.HCPMMP1_combined.annot
	
	# RH
	mri_surf2surf --srcsubject fsaverage --trgsubject $SUB --hemi rh \
	--sval-annot $SUBJECTS_DIR/fsaverage/label/rh.HCPMMP1_combined.annot \
	--tval       $SUBJECTS_DIR/$SUB/label/rh.HCPMMP1_combined.annot
done

#END
