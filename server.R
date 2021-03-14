

library(shiny)
library(httr)
library(visNetwork)
library(geomnet)
library(igraph)
library(tidyverse)
library(plotly)
library(viridis)

rsconnect::setAccountInfo(name='lucascamarena',
                          token='B234121BC0C86FB9E950DFAA00A10BBF',
                          secret='W/i9wi+kRcqg2ecGOREOb9OZWctuyLv40kvFlB4D')

get_symptomas <- function(date, disease) {
    token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJncmFyZG9sYWdhckBnbWFpbC5jb20iLCJhdWQiOiJ3ZWIiLCJuYW1lIjoiR2VyYXJkbyBMYWd1bmVzIEdhcmPDrWEiLCJ1c2VyIjp0cnVlLCJpYXQiOjE1MTM4MDY4MjB9.vGaQE6HHucr8DOM8MNnBWOCnV2dPE0r2qu_9NsYFEI-PCn5J6_iyhTUH4pwBoWCIVyvIjpNwk9vOnjQmS0-wXQ"
    url = sprintf(
        "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=%s&diseaseName=%s&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=%s",
        date,
        disease,
        token
    )
    request <- httr::GET(url)
    temp <- data.frame(date = character(), symptoms = character())
    
    data <- httr::content(request)
    if (data[["responseCode"]] < 400) {
        diseaseList <- data$diseaseList[[1]][['disnetConceptList']]
        
        for (sint in diseaseList) {
            temp <-
                rbind(temp, data.frame(date = date, symptoms = sint$name))
        }
    }
    
    return(temp)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$disease <- isolate(renderText({ input$disease }))
    output$initial_date <- isolate(renderPrint({ input$initial_date }))
    output$end_date <- isolate(renderPrint({ input$end_date }))
    observeEvent(input$do, {
        # vector with the dates
        initial <- input$initial_date %>% as.character()
        end <- input$end_date  %>% as.character()
        dates <- seq(as.Date(initial), as.Date(end), by="days")
        wd <-   dates %>% weekdays() %in% c('lunes', 'monday', 'friday', 'viernes')
        dates <- dates[wd]
        dis <- input$disease %>% as.character()
        # empty dataframe
        out <- data.frame(date = character(), symptoms = character())
        
        for (i in seq(1:length(dates))){
            d = as.character(dates[i])
            print(d)
            out <- rbind(out, get_symptomas(d, dis))
        }
        
        out <- out %>% mutate(symptom_id = symptoms %>% as.integer())
        
        aux <- out %>% group_by(symptoms) %>% summarise( width = n()) 
        
        print("aux_ok")
        nodes1 <- aux %>% dplyr::transmute(id = symptoms,
                                           label = symptoms) %>% rbind(data.frame(id=dis,label=dis))
        
        edges1 <- aux %>% transmute(from = dis, to = symptoms, width)
        
        output$network <- renderVisNetwork({visNetwork(nodes1, edges1) %>% visIgraphLayout() %>% 
                visNodes(color = list(
                    background = "#440154FF",
                    border = "#481567FF",
                    highlight = "#FDE725FF"
                )) %>%
                visEdges(color = list(color = "#440154FF", highlight = "#FDE725FF"))})
        print("network_ok")
        output$graph2 <-renderPlotly({
            ggplot(data = out, aes(
                x = date,
                y = symptom_id,
                color = symptoms
            )) + geom_point() + geom_line(aes(group = symptoms)) + scale_color_viridis(discrete = T)})
        print("graph_ok")
        
    })

})
