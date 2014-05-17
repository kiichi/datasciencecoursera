data<-read.fwf("getdata-wksst8110.for",skip=4,
               widths=c(12, 7,4, 9,4, 9,4, 9,4))
print(head(data))

#     Weekly.SST.data.starts.week.centered.on.3Jan1990
# 1                  Nino1+2      Nino3        Nino34        Nino4
# 2  Week          SST SSTA     SST SSTA     SST SSTA     SST SSTA
# 3  03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
# 4  10JAN1990     23.4-0.8     25.2-0.3     26.6 0.1     28.6 0.3
# 5  17JAN1990     24.2-0.3     25.3-0.3     26.5-0.1     28.6 0.3
# 6  24JAN1990     24.4-0.5     25.5-0.4     26.5-0.1     28.4 0.2

print(sum(data[[4]]))