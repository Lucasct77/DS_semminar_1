#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(httr)
library(jsonlite)

#SYMPTOMS
#cancer
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Cancer&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
cancer <- symptom[["diseaseList"]][4]
#pancreatitis
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Pancreatitis&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
pancreatitis <- symptom[["diseaseList"]][4]
#pneumonia
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Pneumonitis&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
pneumonia <- symptom[["diseaseList"]][4]
#Arthritis
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Arthritis&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
arthritis <- symptom[["diseaseList"]][4]
#Anterior compartment syndrome
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Anterior%20compartment%20syndrome&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
Anterior_compartment_syndrome <- symptom[["diseaseList"]][4]
#Anterior cruciate ligament injury
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Anterior%20cruciate%20ligament%20injury&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
Anterior_cruciate_ligament_injury <- symptom[["diseaseList"]][4]
#Epilepsy
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Epilepsy&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
Epilepsy <- symptom[["diseaseList"]][4]
#Listeriosis
symptom_url <- "http://disnet.ctb.upm.es/api/disnet/query/disnetConceptList?source=wikipedia&version=2018-09-15&diseaseName=Listeriosis&matchExactName=true&diseaseCode=&typeCode=&forceSemanticTypes=&token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbmdlbC5zYW5jaGV6LmZlcm5hbmRlei1jYXJvQGFsdW1ub3MudXBtLmVzIiwiYXVkIjoid2ViIiwibmFtZSI6IkFuZ2VsIFNhbmNoZXoiLCJ1c2VyIjp0cnVlLCJpYXQiOjE2MTUyMzE0MTN9.A1q9goQrmUDPJe0PUJRAwlUSbB4KD3TteuGLmFTCtzHHsKoggZ8m8hw5CyRp4_hJHtYvgmyCJ7fyGHWnfxqs_A"
symptom <- GET(symptom_url)
symptom <- fromJSON(content(symptom, type = "text"))
Listeriosis <- symptom[["diseaseList"]][4]

diseases <- c(Anterior_compartment_syndrome, Anterior_cruciate_ligament_injury, arthritis, cancer, Epilepsy, Listeriosis, pancreatitis, pneumonia)
diseases <- data.frame(diseases)
diseases_name <- c("Anterior_compartment_syndrome", 
                   "Anterior_cruciate_ligament_injury",
                   "arthritis", 
                   "cancer", 
                   "Epilepsy", 
                   "Listeriosis", 
                   "pancreatitis",
                   "pneumonia")

diseases_name <- data.frame(diseases_name)
diseases_final <- data.frame(row.names = diseases, diseases_name)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Diset visualization app"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("disease", "Disease"),
            dateInput("initial_date", "Initial date:", value = Sys.Date()-30),
            dateInput("end_date", "Initial date:", value = Sys.Date()),
            actionButton("do", "Search diesease")
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            textOutput("message")
        )
    )
))
