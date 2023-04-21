

pro timeit, filename, index_file, niter

total_times = FLTARR(niter)
index_times = FLTARR(niter)
obsbk_times = FLTARR(niter)
load_times = FLTARR(niter)
base1_times = FLTARR(niter)
base2_times = FLTARR(niter)
base3_times = FLTARR(niter)

freeze

for i=0L,niter-1L do begin

    FILE_DELETE, index_file

    start_time = systime(/seconds)
    filein, filename
    index_time = systime(/seconds)
    index_times[i] = (index_time - start_time)*1d3

    ; Load everything into memory.
    ; Count will have the number of rows in the file.
    ; Found in get.pro
    data = !g.lineio->get_spectra(count)
    ; data can be accessed as: *dc[i].data_ptr
    load_time = systime(/seconds)
    load_times[i] = (load_time - index_time)*1d3

    ; Get number of channels.
    nchan = size(*data[0].data_ptr,/N_ELEMENTS)

    ; Fill data containers. Equivalent to creating obsblocks.
    for j=0L,count-1L do begin
        get,index=j
    endfor
    obsbk_time = systime(/seconds)
    obsbk_times[i] = (obsbk_time - load_time)*1d3
    
    ; Set the range of channels to be excluded from the baseline fitting.
    ; This will only work if the number of channels does not change.
    chanl=nchan*(0.5-0.25/2d0)
    chanu=nchan*(0.5+0.25/2d0)

    baseline_all, data, count, 1, nchan, chanl, chanu
    b1_time = systime(/seconds)
    base1_times[i] = (b1_time - obsbk_time)*1d3

    baseline_all, data, count, 2, nchan, chanl, chanu
    b2_time = systime(/seconds)
    base2_times[i] = (b2_time - b1_time)*1d3

    baseline_all, data, count, 3, nchan, chanl, chanu
    b3_time = systime(/seconds)
    base3_times[i] = (b3_time - b2_time)*1d3

    total_times[i] = (b3_time - start_time)*1d3

endfor

print,"Load: ", MEAN(load_times), " Index: ", MEAN(index_times), " ObsBlock: ", MEAN(obsbk_times), " Baseline 1: ", MEAN(base1_times), " Baseline 2: ", MEAN(base2_times), " Baseline 3: ", MEAN(base3_times), " Total: ", MEAN(total_times)
print,MEAN(load_times)," ",MEAN(index_times)," ",MEAN(obsbk_times)," ",MEAN(base1_times)," ",MEAN(base2_times)," ",MEAN(base3_times)," ",MEAN(total_times)

end
