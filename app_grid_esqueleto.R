library(shiny)
library(imola)
library(tidyverse)
library(highcharter)
# https://public.tableau.com/app/profile/marius5597/viz/NorthwindDashboard_16759560738830/Overview


breakpoint_system <- getBreakpointSystem()

breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("md", max = 1180)
)


ui <- navbarPage(id = 'navbar_page',
  title = "Investio",
  tabPanel("My Companies",
           gridPanel(
             tags$style(
               '

     body{
    padding: 1em;
    background: whitesmoke;
     }

    @import url("https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

    @import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

    *{
      font-family: "Exo 2", sans-serif;
    }




  @media only screen and (max-width: 1180px) {



  }

  @media only screen and (max-width: 575px) {

  .card{

   display: none;

  }

}
    '
             ),
             title = "Pharmaceutical Price Monitor",
             breakpoint_system = breakpoint_system,
             style = 'padding:1em;
             background: #e7e7e9;
             border:5px solid; ',
             # fill_page = TRUE,
             # auto_fill = TRUE,

             rows = list(
               default = ".5fr 1fr 1fr"
               # md = "auto auto auto auto auto "
             ),
             # columns = c(default = ".5fr 1fr 1fr 1fr"),
             areas = list(
               default = c(
                 "marquee marquee marquee marquee",
                 "left_info left_info main_chart main_chart",
                 "cards_bottom cards_bottom cards_bottom cards_bottom"
               )
               # md = c(
               #   "header_cards header_cards header_cards header_cards",
               #   "sales sales sales sales ",
               #   "sales_splits sales_splits top_products top_products",
               #   "top top top_clients top_clients",
               #   "category category category category "
               # )
             ),
             gap = list(
               default = "5px",
               md = "10px",
               xs = "15px"
             ),

             # - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -
             tags$div(
               class = "marquee",
               style = "background: whitesmoke;
    padding: 1em;flex:1;
    border:1px solid lightgray;",
               h6('Marquee Area')

             ),

# - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -
             div(
               class = "left_info",
               style = "background: whitesmoke;
    padding: 1em;
    border:1px solid lightgray",
               div(
                 style = '
                 display: flex;
                 flex-direction: column;
                 flex:1;
                 height: 100%;',
                 h5('Logo', style = 'text-align: center;border:2px solid; flex:1'),
                 h5('Middle Text', style = 'text-align: center;border:2px solid; flex:1'),
                 h5('User Area', style = 'text-align: center;border:2px solid; flex:1')

               )
             ),
# - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -

             div(
               class = "main_chart",
               style = "background: whitesmoke;
    padding: 1em;
    border:1px solid lightgray;

    display: flex;
    flex-direction: column;",
               h1('Chart Title'),
               tags$div('',
                        class = 'div_charts',
                        style  ='height:400px;border:2px solid;
                        padding:1em;gap:2em;
                        display: flex;flex:1',
                        h1('Info', style = 'flex:1; border:2px solid;'),
                        h1("Chart", style = 'flex:1; border:2px solid;')
               )

             ),
# - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -

             div(
               class = "cards_bottom",
               style = "background: whitesmoke;
    padding: 1em;flex:1;
    border:1px solid red; ",
               h1('Investments Radar'),
               flexPanel(
                 id = 'top_cards',
                 # wrap = "wrap",
                 # justify_content = 'space-AROUND',
                 # align_items = 'center',
                 gap = '2em',
                 # basis = c("300px"),
                 shrink = c(0),
                 h1('Info', style = 'height: fit-content;border:2px solid;'),
                 h1("Chart", style = 'height: fit-content;border:2px solid;'),
                 h1('Info', style = 'height: fit-content;border:2px solid;'),
                 h1("Chart", style = 'height: fit-content;border:2px solid;')


               )
             )
           )),
  tabPanel("WaitLists"),
  tabPanel("IPO"),
  tabPanel("Analysts")

)

server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)
