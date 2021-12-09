library(prism)

prism_set_dl_dir("/Volumes/Sand/prism_data")

# get_prism_dailys(
#   type = "tmean", 
#   minDate = "2013-06-01", 
#   maxDate = "2013-06-14", 
#   keepZip = FALSE
# )
get_prism_monthlys(type = "tmean", year = 2018:2021, mon = 1:12, keepZip = FALSE)
#get_prism_annual("ppt", years = 2000:2015, keepZip = FALSE)

test <- prism_archive_subset(
  "tmean", "monthly", year = 2018, mon = 11)
pd_image(test)

p <- pd_plot_slice(
  prism_archive_subset("tmean", "monthly", year = 2018:2020),
  c(-73.2119,44.4758)
)
print(p)

#not really sure what the purpose of stacking is here--use slice above
stack = pd_stack(prism_archive_subset(
  "tmean", "monthly", year = 2018:2020, mon = 1:12))
slice = pd_plot_slice(stack,c(-73.2119,44.4758))
