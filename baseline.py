import time
import numpy as np
from astropy.io import fits

if __name__ == "__main__":


    filename = "/home/scratch/psalas/support/UMD-py/examples/onoff-L/data/TGBT21A_501_11.raw.vegas.fits"

    hdu = fits.open(filename)
    table = hdu[1].data

    start_time = time.perf_counter_ns()

    for i in range(len(table)):

        data = table["DATA"][i]
        x = np.arange(len(data))
        pfit = np.polyfit(x, data, 1)
        pval = np.poly1d(pfit)(x)
        data -= pval

    end_time = time.perf_counter_ns()

    print(f"Total time: {(end_time - start_time)*1e-6}")

    start_time = time.perf_counter_ns()

    for i in range(len(table)):

        data = table["DATA"][i]
        x = np.arange(len(data))
        ch0 = int(len(data)*(0.5-0.25//2))
        chf = int(len(data)*(0.5+0.25//2))
        x_ = np.hstack((x[:ch0],x[chf:]))
        y_ = np.hstack((data[:ch0],data[chf:]))
        pfit = np.polyfit(x, data, 1)
        pval = np.poly1d(pfit)(x)
        data -= pval

    end_time = time.perf_counter_ns()

    print(f"Total time: {(end_time - start_time)*1e-6}")
