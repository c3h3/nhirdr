

#' @import foreach iterators
oneLineParser.cd <- function(schema_df, oneLine) {
  foreach(one_col = iter(schema_df,by = "row")) %do% substr(oneLine, one_col$StartIdx, one_col$EndIdx)
}

#' @import foreach iterators magrittr
#' @export
parser.cd <- function(lines, schema_df) {
  df = foreach(l = lines, .combine = rbind, .multicombine = T) %do% {
    oneLineParser.cd(schema_df, l)
  } %>% data.frame()
  colnames(df) = schema_df$ColNameEn
  df
}



