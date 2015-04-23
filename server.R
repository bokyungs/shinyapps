library(shiny)
data(iris)


drawPlot <- function(choice) {
# draw an appropriate plot based on the selection the user made: Petal info, Sepal info., or both
    
    if (choice == "1") 
        
        plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg = c("black", "red", "green3")[unclass(iris$Species)])
    else if (choice == "2")
       
        plot(iris$Sepal.Length, iris$Sepal.Width, pch=21, bg = c("black", "red", "green3")[unclass(iris$Species)])
    else
        pairs(iris[1:4], main = "Iris Data", pch = 21, bg = c("black", "red", "green3")[unclass(iris$Species)])
}

showSelection <- function(choice) {
    if (choice == "1") 
        print("You chose Petal")
    else if (choice == "2")
        print("You chose Sepal")
    else 
        print("You chose both Petal and Sepal")
}

check_answer <- function(choice) {
    
# Check to see if the choice the user made corresponds to the iris with the shortest average Petal length
    
    shortest <- 100
    len <- mean(iris[iris$Species == "setosa", "Petal.Length"])
    if (len < shortest) {
        name <- "Setosa"
        shortest <- len
    }
    len <- mean(iris[iris$Species == "versicolor", "Petal.Length"])
    if (len < shortest) {
        name <- "Versicolor"
        shortest <- len
    }
    
    len <- mean(iris[iris$Species == "virginica", "Petal.Length"])
    if (len < shortest) {
        name <- "Virginica"
        shortest <- len
    }
    
   
    if (choice == "1") 
        userChose <- "Setosa"
    else if (choice == "2")
        userChose <- "Versicolor"
    else
        userChose <- "Virginica"
    
   
    if (userChose == name) 
        paste("That's correct! The average petal length of", name, "is:", as.character(shortest))
    else
        paste(userChose, "is not correct.  Try again.")
}

shinyServer(
    function(input, output) {
       
        output$plot <- renderPlot(drawPlot(input$radio1))
        output$oid2 <- renderText({
            if (input$goButton) {
                isolate(check_answer(input$select1))
            }
        })
        
    }
)