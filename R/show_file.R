#' show contents of a file with syntax highlighting
#'
#' @param file a path to a file to show
#' @param lang the language used for syntax higlighing
#'
#' @export
show_file <- function(file, lang = tools::file_ext(file)) {
  content <- paste(readLines(file), collapse = "\n")
  knitr::asis_output(
    paste0(
      "```", lang, "\n",
      content, "\n",
      "```"
    )
  )
}
