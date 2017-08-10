SCHEMA_DF_PATH = Sys.getenv("SOME_DIR","/home/rstudio/demo/NHIRD/schema_df.csv")
CD_FILE_PATH = Sys.getenv("CD_FILE_PATH","/home/rstudio/demo/NHIRD/TDB_CD1996.DAT")
OUTPUR_RDATA_PATH = Sys.getenv("OUTPUR_RDATA_PATH","/home/rstudio/df.RData")
N_LINES = as.integer(Sys.getenv("N_LINES",100))


library(readr)
schema_df <- read_csv(SCHEMA_DF_PATH)
total_lines <- read_lines(CD_FILE_PATH)

library(nhirdr)


if (N_LINES > 0){
  df = nhirdr::parser.cd(total_lines[1:N_LINES],schema_df)
}else{
  df = nhirdr::parser.cd(total_lines,schema_df)
}

save(df, file = OUTPUR_RDATA_PATH)




