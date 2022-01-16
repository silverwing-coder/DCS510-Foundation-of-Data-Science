#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# install.packages("shiny")

library(shiny)

page_one <- tabPanel(
    "First page",
    titlePanel("Page 1"),
    
    sidebarLayout(
        sidebarPanel(
            textInput(inputId =  "username", label = "What is your name?"),
            textOutput(outputId = "message")
        ),
        mainPanel(
            h3("Primary Content"),
            p("Plots, data tables, etc. would go here")
        )
    )
)

page_two <- tabPanel(
    "Second page"
)

page_three <- tabPanel(
    "Third page"
)

# Define UI for application that draws a histogram

#ui <- fluidPage(
ui <- navbarPage(
    "My applications", 
    page_one,
    page_two, 
    page_three
    
#    sidebarLayout(
#        sidebarPanel(
#            p("Sidebar panel content goes here")
#        ),
#        mainPanel(
#            p("Main panel content goes here"),
#            p("Layouts usually include multiple content elements")
#        )
#    )    

    
#    h2("Greeings from shiny"),
    
#    textInput(inputId = "username", label = "What is your name?"),
#    textOutput(outputId = "message"),
    
    # Static elements
#    tags$h2("Heading h2"),
#    tags$p("Some text in p tag"),
#    tags$h3("This is my", em("Shiny"), "App exercise"),
    #    ![image_discription]("image_file/logo.svg")
#    tags$img(src = "../image_files/cu_logo.png", width = "100px", height = "100px"),
#    tags$p(),
#    tags$a("\nThis is link to google", src="https://google.com"),
#    tags$iframe(src = "https://shiny.rstudio.com/articles/tag-glossary.html", seamless=NA),
    
#    sliderInput(
#        inputId = "age",
#        label = "Age of subjects",
#        min =18,
#        max = 80,
#        value = 42
#    ),
    #    tableOutput(outputId = "table_value"), 
#    plotOutput(outputId = "my_chart") 
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$message <- renderText({
        message_str <- paste0("Hello ", input$username, "!")
        message_str
    })

#    output$my_chart <- renderPlot({
#        x <- faithful[ , 2]
#        bins <-seq(min(x), max(x), length.out = input$age + 1)
#        hist(x, breaks = age, col = 'darkgray', border = 'white')
#    })
}

# Run the application 
shinyApp(ui = ui, server = server)
