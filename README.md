# gbtidl-testing
Performance testing for GBTIDL

## Runing the tests
`gbtidl -e timeit_all &> timeit.log`

Then parse timeit.log for the results.

## Timing results
The results are found in: tab\_gbtidl.out  
The table uses the IPAC format. More details on individual columns can be found here: <https://github.com/GreenBankObservatory/dysh/tree/mwp-devel/benchmark#output>

## Differences with respect to `dysh` benchmarks
I could not split the HDUs. This is mainly an issue for TGBT17A\_506\_11.raw.vegas.A.fits. For this file there are two rows, but the second one has zero in all timing results.
