#' @title label_transitions
#'
#'
#' @description A function for filling the transitions in a process map DiagrammeR object
#' @param diagrammerProcessMap The diagrammer object for which we will add values to the attributes
#' @param columns Defines in a vector the names of the columns containing the captions and/or metrics to be used
#'
#' @examples
#' \dontrun{
#' library(eventdataR)
#' data(patients)
#' map <- process_map(patients, render = F)
#' 
#' }
#' @export label_transitions

label_transitions <- function( diagrammerProcessMap,
                         columns =c(),
                         rounding = 2
){
    if (length(columns) > 1)
        diagrammerProcessMap$edges_df$tempVarGjdasflx <-  apply( smartRounderDF(get_edge_df(diagrammerProcessMap)[ , columns ] ,rounding), 1 , paste , collapse = "\n\r" )
    else if (length(columns) == 1)
        diagrammerProcessMap$edges_df$tempVarGjdasflx <-  smartRounderV(get_edge_df(diagrammerProcessMap)[, columns[1]],rounding)
    else #no columns
        diagrammerProcessMap$edges_df$tempVarGjdasflx <- " "
    
    diagrammerProcessMap %>%
        mutate_edge_attrs(label = tempVarGjdasflx)
}