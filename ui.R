library(shiny)
options(scipen = 999)

fluidPage(
  titlePanel("Bénéficiaires des Fonds européens (hors PAC)"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "Nom",
        label = "Nom de l'organisme bénéficiaire",
        choices = c("Tous",unique(as.character(minibddpourshiny$Nom)))),
      selectInput(
        inputId = "Fonds",
        label = "Fonds européen",
        choices = c("Tous",unique(as.character(minibddpourshiny$Fonds)))),
      selectInput(
        inputId = "Programme",
        label = "Nom du programme",
        choices = c("Tous",unique(as.character(minibddpourshiny$Programme)))),
      sliderInput("slider2", "Financement €", min = round(min(minibddpourshiny$MontantFinEuro,na.rm = T),0), 
                  max = round(max(minibddpourshiny$MontantFinEuro,na.rm = T),0), value = c(1000000, 2000000), 
                  step = 1000)
    ),
    mainPanel(
      verbatimTextOutput("coucouslider2"),
      verbatimTextOutput("coucouslider21"),
      verbatimTextOutput("coucouslider22"),
      DT::dataTableOutput("table", width = "100%")
    )
  )
)