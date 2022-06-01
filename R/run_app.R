
#' @export
#' @importFrom shiny shinyApp
shiny_mon_app <- function() {
  appDir <- system.file("app", package = "docker")
shiny::runApp(appDir, display.mode = "normal")
}
