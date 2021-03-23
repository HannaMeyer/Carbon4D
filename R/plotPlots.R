#' Plot the Carbon4D plots
#' @description
#' @param URL of the Carbon-4D data base
#' @details 
#' @note 
#' @return A mapview output
#' @author
#' Hanna Meyer
#' @references 
#' @examples
#' \dontrun{
#' plotPlots()
#' }
#' @export plotPlots
#' @aliases plotPlots
plotPlots <- function(url){
  plots <- readr::read_csv(gsheet::construct_download_url(url))
  plots <- plots[plots$PlotID!="P0000",]
  plots_sf <- sf::st_as_sf(plots,coords = c("Lon","Lat"))
  sf::st_crs(plots_sf) <- 4326
  mapview::mapview(plots_sf)
}