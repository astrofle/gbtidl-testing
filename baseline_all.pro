

pro baseline_all, data, count, order, nchan, chanl, chanu


for i=0d0,count-1d0 do begin

    ; Fill DC 0 with the data.
    *!g.s[0].data_ptr=*data[i].data_ptr

    ; Start baseline subtraction.
    ;setxunit,"Channels" ; Only works with a display.
    chan
    nregion,[0,chanl,chanu,nchan]
    nfit,order
    ;bshape ; Raises an error without display.
    baseline

endfor



end
