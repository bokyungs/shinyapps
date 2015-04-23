library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Plotting Iris Data"),
   sidebarPanel(
      radioButtons(inputId="radio1", label="Which plot to display?", choices=c("Petal" = "1", "Sepal"="2", "Both" = "3"), selected="1"),
       
      selectInput(inputId="select1", label="Which has the shortest average petal length?", choices=c("Setosa" = "1", "Versicolor" = "2", "Virginica" = "3")),
      actionButton(inputId="goButton", label="Submit")
     
   ),
    mainPanel(
        
        plotOutput("plot"),
        verbatimTextOutput("oid2")  
        
    )
))
