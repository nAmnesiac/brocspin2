01 - Simulation of 8k7w from ordered state using native iConRNA scripts (pretty much)
02 - Simulation of 8k7w from disordered state using native iConRNA scripts
03 - Broken simulation of DFHBI using first draft of custom top/param, instant crash (dfhbi_CG.psf, 2dihed/3improp)
04 - Batch simulations of ordered 8k7w using native iConRNA scripts at varying temperatures

05 - All (kind of) organized simulation files from ligand parameterization (25/11/27) 
	All simulated with included run.py - xtc output frequency 1 and smaller timestep
	Ref: 	param/top.inp - every angle, 2 dihed, 2 improp
		param2/top2.inp - missing 2 linear angles, no diehed, 2 improp
		param3/top3.inp - no linear angles, 2 improp, 1 dihed (nonlinear)
		2.psf - 2 dihed 2 impop, 
3.psf - 0 dihed 2 impop 0 linear angles, 
4.psf - 0 dihed 2 impop 0 linear angles rearranged order of second improp, 
5.psf - 1 dihed 2 impop 0 linear angles 

	01 - dfhbi with param 1, impropers set to 0 - uses psf2
	02 - dfhbi with param 1, impropers set to calculated angles (close to 0), this trajectory was observed to explode after approaching linearity and so suggested removing linear angles - psf2
	03 - dfhbi with param2, removed dihedrals and angles, better but very very floppy - psf3
	04 - same as 03 but with improper strength doubled - psf3
	05 - same as 04 but second improper given 180 degree value to try and flip upper ring (this does not work at all - psf3
06 - back to 0 deg impropers, changed the order of second improper to exclude linearity - psf4
07 - added one more dihed and is now stable - psf5

