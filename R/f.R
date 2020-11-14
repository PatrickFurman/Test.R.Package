

f = function(x) {
  return(sample(LETTERS,1))
}

f_in_parallel = function(x) {
  library(parallel)
  num_cores = detectCores()
  cl = makeCluster(num_cores - 1)

  start = Sys.time()
  x = parLapply(cl, 1:1000000, f)
  end = Sys.time()
  parallel_time = end-start

  stopCluster(cl)
  return (parallel_time)
}

f_not_parallel = function(x) {
  library(parallel)
  start = Sys.time()
  y = lapply(1:1000000, f)
  end = Sys.time()
  regular_time = end-start

  return(regular_time)
}
