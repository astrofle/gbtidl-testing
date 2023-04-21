
pro timeit_all

print,"TGBT21A_501_11.raw.vegas.fits"
timeit,"/home/scratch/psalas/support/UMD-py/examples/onoff-L/data/TGBT21A_501_11.raw.vegas.fits","/home/scratch/psalas/support/UMD-py/examples/onoff-L/data/TGBT21A_501_11.raw.vegas.index",10

print,"TGBT17A_506_11.raw.vegas.A.fits"
timeit,"/home/scratch/psalas/support/UMD-py/examples/mapping-L/data/TGBT17A_506_11.raw.vegas/TGBT17A_506_11.raw.vegas.A.fits","/home/scratch/psalas/support/UMD-py/examples/mapping-L/data/TGBT17A_506_11.raw.vegas/TGBT17A_506_11.raw.vegas.A.index",10

print,"TSCAL_220105_W.raw.vegas.E.fits"
timeit,"/home/scratch/psalas/support/UMD-py/examples/rxco-W/data/TSCAL_220105_W.raw.vegas/TSCAL_220105_W.raw.vegas.E.fits","/home/scratch/psalas/support/UMD-py/examples/rxco-W/data/TSCAL_220105_W.raw.vegas/TSCAL_220105_W.raw.vegas.E.index",10

print,"TGBT22A_503_02.raw.vegas.F.fits"
timeit,"/home/scratch/psalas/support/UMD-py/examples/nod-KFPA/data/TGBT22A_503_02.raw.vegas/TGBT22A_503_02.raw.vegas.F.fits","/home/scratch/psalas/support/UMD-py/examples/nod-KFPA/data/TGBT22A_503_02.raw.vegas/TGBT22A_503_02.raw.vegas.F.index",10

print,"AGBT16B_225_05.raw.vegas.B.fits"
timeit,"/home/scratch/psalas/support/UMD-py/examples/mixed-fs-ps/data/AGBT16B_225_05/AGBT16B_225_05.raw.vegas/AGBT16B_225_05.raw.vegas.B.fits","/home/scratch/psalas/support/UMD-py/examples/mixed-fs-ps/data/AGBT16B_225_05/AGBT16B_225_05.raw.vegas/AGBT16B_225_05.raw.vegas.B.index",10

end
