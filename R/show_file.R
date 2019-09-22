#' show contents of a file with syntax highlighting
#'
#' @param file a path to a file to show
#' @param language the language used for syntax higlighing
#' @importFrom tools file_ext
#'
#' @export
show_file <- function(file, language = file_ext(file)) {
  content <- paste(readLines(file), collapse = "\n")
  knitr::asis_output(
    paste0(
      "```", language, "\n",
      content, "\n",
      "```"
    )
  )
}
