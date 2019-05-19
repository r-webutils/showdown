#' Show a file from github
#'
#' @param repo a github repository
#' @param file a file within the github repository
#' @param ... argumetns passed down to [show_file()]
#'
#' @examples
#' \dontrun{
#' show_file_github("GregorDeCillia/showdown", "DESCRIPTION")
#' }
#'
#' @export
show_file_github <- function(repo, file, ...) {
  raw_file <- paste0(
    "https://raw.githubusercontent.com/", repo, "/master/", file
  )
  show_file(raw_file, ...)
}
