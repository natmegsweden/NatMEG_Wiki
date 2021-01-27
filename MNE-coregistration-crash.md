**Problem:** MNE coregistration `mne.gui.coregistration()` in Python crash the entire session.

**Cause:** might be some incompatibility between 3D render function and video drive (or lack thereof on Compute).

**Solution:** Run this snippet of code in the terminal before starting Spyder: `export MESA_GL_VERSION_OVERRIDE=3.3`