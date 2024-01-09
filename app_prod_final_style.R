library(shiny)
library(imola)
library(tidyverse)
library(highcharter)
library(shinyWidgets)

# https://public.tableau.com/app/profile/marius5597/viz/NorthwindDashboard_16759560738830/Overview


breakpoint_system <- getBreakpointSystem()

breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("md", max = 1170)
)

df_revenue <- data.frame(x = paste0(month.abb[1:5]," - 2021"),
                         y = runif(n = 5,min = 20, max = 30),
                         colors = c(color = c('#0F60D2','#0F60D2',
                                              '#EF2D3E','#EF2D3E',
                                              '#EF2D3E')))

df_cards <- data.frame(
  x = paste0(month.abb[1:5], " - 2021"),
  y = runif(n = 5, min = 20, max = 30),
  colors = c(
    color = c('#0F60D2', '#0F60D2', '#EF2D3E', '#EF2D3E', '#EF2D3E')
  )
)

df_cards$x <- as.Date(paste("2021", 1:5, 1, sep = "-"))




ui <- navbarPage(id = 'navbar_page',
                 title = tags$img(class = 'google_icon',
                                  src = 'img/google.png',
                                  width = '18px', height = '18px'),
                 textInput("searchField",label = tags$img(class = 'google_icon',
                                                          src = 'img/search_img.png',
                                                          width = '24px', height = '24px'),
                           placeholder = 'Search for a Company'
                 ),

                 tabPanel("My Companies",
                          gridPanel(
                            tags$style(
                              '
                              .navbar.navbar-default .container-fluid{
                              background:black;

                              }

                               .navbar.navbar-default{
                                margin:0px;
                              }

                              #navbar_page{
                              position: relative;
                              background: black;
                              color: white


                              }

                              .navbar.navbar-default ul li a{

                              color: white;
                              font-weight:700;

                              }

                              .navbar.navbar-default ul li.active a{
                              background: whitesmoke !important;
                              color: black;

                              border-radius: 50px;
                              padding: .5em 1em;
                              margin-top: .75em;
                              font-weight:700;
                              }

                              .navbar.navbar-default ul li {

                              background: black

                              }

                            .form-group {
                              position: absolute;
                              top: 1.75em;
                              right: 2em;
                              z-index: 99999999;

                            }

                            .form-group label{
                              position: absolute;
                              right:.5em;
                              top:.25em;
                              border-radius:5px

                            }

                            .form-group #searchField{
                            background: gray;
                            color: red !important;
                            border: none;


                            }


     body{
    padding: 1em;
    background: whitesmoke;
     }

    @import url("https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");


    *{
      font-family: "Exo 2", sans-serif !important;
    }


    .container-fluid:nth-child(2){

    padding:0px;
    }

    /************************************************/
/**************MARQUEE AREA ****************/
/************************************************/
.marquee-container{
    display: flex;
    align-items: center;
    justify-content: end;
    background: white;
    overflow: hidden;
    padding: 0.5em 2em;
    margin-bottom: 0em;
    border-bottom: 1px solid lightgray;
}

.marquee {
    display: flex;
    /*padding: 0.25em 0;*/

    white-space: nowrap;
    animation: marquee 7s infinite linear;
    font-weight: 500;
    margin: 0px;
    width: 100vw;
    font-size: .5em;
    font-family: sans-serif;
    background: white;
}

/* notice the infinite */
.marquee:after{

}


@keyframes marquee{
    0% {
        transform: translateX(0)
    }
    100% {
        transform: translateX(-40%)
    }
}

.marquee p{
  color: black;
  font-size: 1.5em;
  font-weight: 600;
}

.marquee span{
  font-weight: 600;
  font-size: 1.5em;
  margin: 0 1em !important;
}

.marquee span img{
  height: 1em;
}

/********************************************************************************/



 #modal {

  width: fit-content;
  background: transparent;
  border:none;
  padding: 0.5em;
 }



 .div_inputs_inline{

 position: relative;
    /* margin: 0.25em 0; */
    padding: 1em;

 }

 .div_inputs_inline .form-group{
    position: absolute;
    top:0;
}

.div_inputs_inline .form-group:nth-child(1) {
    right: 11em;
    width: fit-content;
    margin-right:-5em;
}

.card{
border-radius: 10px;

}

.card ul.card_list li{
  padding: 1rem 0;

}

.card ul.card_list li:nth-child(1){
  font-size: 1.75rem;

}
.card ul.card_list li:nth-child(2) span{
  font-size: 1.25rem;
  color: gray;
  font-weight: 600;


}

.card .form-group.shiny-input-container{
 position: relative;
 right: 0em;
 top: 0em;


}

.card .form-group.shiny-input-container .material-switch label{

    position: relative;
    right: 0;
    top: 0;
    border-radius: 5px;

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
                            title = "Investio Stock app",
                            breakpoint_system = breakpoint_system,
                            style = 'margin:0px; background: #e7e7e9; ',
                            # fill_page = TRUE,
                            # auto_fill = TRUE,

                            rows = list(
                              default = ".1fr 1fr 1.5fr ",
                              md = ".1fr .5fr .5fr 1.25fr  1.5fr "

                            ),
                            columns = c(default = "1fr 1fr "),
                            areas = list(
                              default = c(
                                "marquee-container marquee-container ",
                                "left_info  main_chart ",
                                "cards_bottom cards_bottom  "
                              ),

                              md = c(
                                "marquee-container marquee-container ",
                                "left_info left_info   ",
                                "main_chart main_chart",
                                "cards_bottom cards_bottom  ",
                                "cards_bottom cards_bottom  "

                              )


                            ),
                            gap = list(
                              default = "1em 0;",
                              md = "10px",
                              xs = "15px"
                            ),
                            div(class = "marquee-container",
                                div(class = "marquee",
                                    lista_marquee,lista_marquee)
                            ),
                            # - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -
                            div(
                              class = "left_info",
                              style = "padding: 1em;
                                       ",
                              div(
                                style = '
                                         display: flex;
                                         flex-direction: column;
                                         flex:1;',

                                h4('Hello  Hans, its good to be back',
                                   style = 'text-align: center;
                                   flex:1; background: white;
                                   display:flex;
                                   justify-content: space-between;
                                   align-tems: center;
                                   border-radius: 5px;
                                   padding:2em;',
                                   tags$button(

                                     tags$img(src = 'img/synch.png',
                                              width = '24px', height = '24px',
                                              tags$span('Sync with Google Charts',
                                                        style = 'font-size: 1.25rem; font-weight: 600;')))),
                                div(style = 'text-align: center;
                                   flex:1; background: transparent;
                                   display:flex;
                                   justify-content: space-between;
                                   align-tems: center;
                                   border-radius: 5px;
                                   padding:2em;',
                                    div(
                                      class = 'inputs_left_right',
                                      style = 'position: relative;
                                     width:100%;

                                     justify-content: end;',
                                      h4('Current Portfolio',
                                         class = 'div_inputs_inline',
                                         style = 'position: relative;right:0;',
                                         pickerInput(
                                           inputId = "my_savings",
                                           width = 'fit',

                                           choices = c("My Savings")
                                         ),
                                         pickerInput(
                                           inputId = "add_instruments",
                                           width = 'fit',

                                           choices = c("Add Wallet")
                                         ),
                                         style = 'margin:.25em 0; padding: .5em; text-align:left;')
                                    )),
                                div(
                                  style = 'text-align: center;
                                   flex:1; background: white;
                                   display:flex;
                                   justify-content: space-between;
                                   align-tems: center;
                                   border-radius: 5px;
                                   text-align: left;
                                   padding:2em;',

                                  div(
                                    class = 'left_column',
                                    h5('My Holding'),
                                    tags$ul(
                                      style = 'list-style: none;margin:0px; padding:0px',
                                      tags$li(tags$span('$3.456.000,56', style = ' font-weight:900; font-size: 2.25rem;' ),

                                              tags$span('(+16.02%)',
                                                        style = 'font-size:1.25rem; color: green; font-weight:700')),
                                      tags$li(tags$span('This month (+16.02%)',
                                                        style = 'font-size:.65em; color: green; font-weight:700'))

                                    )

                                  ),
                                  div(
                                    class = 'right_column',
                                    h5('My Revenue'),
                                    tags$ul(
                                      style = 'list-style: none;margin:0px; padding:0px',
                                      tags$li(tags$span('$3.456.000,56', style = ' font-weight:900; font-size: 2.25rem;' ),
                                              tags$span('(+16.02%)',
                                                        style = 'font-size:1.25rem; color: green; font-weight:700')),
                                      tags$li(tags$span('This month (+16.02%)',
                                                        style = 'font-size:.65em; color: gray; font-weight:700'))

                                    )

                                  )


                                )

                              )
                            ),
                            # - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -

                            div(
                              class = "main_chart",
                              style = "padding: 1em;

                                       display: flex;
                                       flex-direction: column;",
                              h4('Revenue Stats'),
                              div(
                                class = 'inputs_left_right',
                                style = 'position: relative;',
                              ),
                              tags$div('',
                                       class = 'div_charts',
                                       style  ='height:300px;
                                                gap:2em; border-radius: 10px;
                                                display: flex;
                                       background: white;
                                       padding: 1em;',
                                       div(style = 'display:flex;
                                           flex-direction: column;
                                           justify-content: space-between;',
                                           tags$ul(
                                             'Average monthly revenues',

                                             style = 'list-style: none;
                                            margin:1em 0;
                                            padding:0px',
                                             tags$li(tags$span('$324,56', style = ' font-weight:900; font-size: 2.25rem;' ),
                                                     tags$span('m/m: -545 (%78)',
                                                               style = 'font-size:.65em; color: gray; font-weight:700')),
                                             tags$li(style = ' margin:1em 0',
                                                     tags$span('Dividend profit: ',
                                                               style = 'font-size:.65em; color: gray; font-weight:700')),
                                             tags$li(style = ' margin:1em 0',
                                                     tags$span('2 forthcomming dividends:',
                                                               style = 'font-size:.65em; color: gray; font-weight:700'))),

                                           actionButton(inputId = 'modal',
                                                        style = '',
                                                        label =tags$img(src = "img/download.png",
                                                                        span("Download pdf report",
                                                                             style = 'font-size: .75em;
                                                           color: blue;font-weight: 600;'),
                                                                        width = '16px', height = '16px')

                                           )),
                                       div(

                                         highchartOutput(outputId = 'top_chart', height = 300))
                              )

                            ),
                            # - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -

                            div(
                              class = "cards_bottom",
                              style = "flex:1; height:370px",
                              h4('Investments Radar',
                                 class = 'div_inputs_inline',
                                 style = 'position: relative;',
                                 pickerInput(
                                   inputId = "edit_list",width = 'fit',

                                   choices = c("Add Instruments")
                                 ),
                                 pickerInput(
                                   inputId = "add_instruments",width = 'fit',

                                   choices = c("Edit List")
                                 ),
                                 style = 'position: relative;
    margin: 0.25em 2em;font-weight: 700;
    padding: 1em;
    text-align: left;'),
                              flexPanel(
                                style  ='background: transparent;padding:1em;',
                                id = 'top_cards',
                                wrap = "wrap",
                                gap = '2em',flex = '300px',

                                div(
                                  class = 'card',
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('PKO (PKOB)', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am'))

                                  ),
                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('PKO (PKOB)', style = 'font-weight:700;')),
                                    tags$li(tags$span('-0.39% - (+0.67%)'))

                                  ),

                                  highchartOutput(outputId = 'line_chart_1', height = '280px'),

                                  materialSwitch(
                                    inputId = "note_1",
                                    label = "Notifications",
                                    width = 150,
                                    right = TRUE
                                  )

                                ),
                                div(
                                  class = 'card',
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CAT.US', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am'))

                                  ),
                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('PKO (PKOB)', style = 'font-weight:700;')),
                                    tags$li(tags$span('+0.39% - (+0.07%)'))

                                  ),

                                  highchartOutput(outputId = 'line_chart_2', height = '280px'),

                                  materialSwitch(
                                    inputId = "note_2",
                                    label = "Notifications",
                                    width = 150,
                                    right = TRUE
                                  )

                                ),
                                div(
                                  class = 'card',
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CAT.US', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', ))

                                  ),
                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('KGH (KGHM)', style = 'font-weight:700;')),
                                    tags$li(tags$span('+0.9% - (+0.49%)'))

                                  ),

                                  highchartOutput(outputId = 'line_chart_3', height = '280px'),

                                  materialSwitch(
                                    inputId = "note_3",
                                    label = "Notifications",
                                    width = 150,
                                    right = TRUE
                                  )

                                ),
                                div(
                                  class = 'card',
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CAT.US', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', ))

                                  ),
                                  tags$ul(
                                    class = 'card_list',
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CDR (CDPROJEXT)', style = 'font-weight:700;')),
                                    tags$li(tags$span('+0.00% - (+0.00%)'))

                                  ),

                                  highchartOutput(outputId = 'line_chart_4', height = '280px'),

                                  materialSwitch(
                                    inputId = "note_4",
                                    label = "Notifications",
                                    width = 150,
                                    right = TRUE
                                  )

                                )


                              )
                            )
                          )),
                 tabPanel("WaitLists"),
                 tabPanel("IPO"),
                 tabPanel("Analysts")

)

server <- function(input, output, session) {

  output$top_chart <- renderHighchart({
    hchart(df_revenue, "column",
           hcaes(x, y, color =colors),

           name = "Revenue",
           color = 'black',
           showInLegend = TRUE)  %>%
      hc_xAxis(enabled = TRUE,
               title = TRUE,

               categories = df_revenue$x,
               style = list(fontStyle = '')) %>%

      hc_yAxis(enabled = FALSE,
               title = FALSE) %>%

      hc_credits(enabled = TRUE) %>%
      hc_plotOptions(series = list(borderRadius = 3.5))
  })

  output$line_chart_1 <- renderHighchart({

    sample_2_colors <-  sample(c('#0F60D2', '#EF2D3E'),1)


    hchart(
      df_cards,
      "area",
      hcaes(x, y, color = colors),

      name = '',
      color = sample_2_colors,
      showInLegend = FALSE
    )  %>%
      hc_xAxis(
        title = NULL,
        gridLineWidth = 0,
        labels = list(format = "{value:%b - %Y}")
      ) %>%

      hc_yAxis(enabled = FALSE,
               opposite = TRUE,
               tickAmount = 6,
               gridLineWidth = 0.5,
               gridLineColor = 'gray',
               gridLineDashStyle = "longdash",
               title = FALSE,
               labels = list(
                 align = 'left',
                 fontWeight = 'bold',
                 x = -20,
                 y = -3,
                 style = list(color =  'black',
                              fontWeight = "bold",
                              fontSize = '10px',
                              fontFamily = "Exo 2")
               ))%>%

      hc_credits(enabled = TRUE)%>%
      hc_plotOptions(series = list(borderRadius = 3.5,
                                   marker = list(enabled = FALSE),
                                   lineWidth = 2,
                                   shadow = TRUE,
                                   fillOpacity = 0.25
      ))


  })

  output$line_chart_2 <- renderHighchart({

    sample_2_colors <-  sample(c('#0F60D2', '#EF2D3E'),1)


    hchart(
      df_cards,
      "area",
      hcaes(x, y, color = colors),

      name = '',
      color = sample_2_colors,
      showInLegend = FALSE
    )  %>%
      hc_xAxis(
        title = NULL,
        gridLineWidth = 0,
        labels = list(format = "{value:%b - %Y}")
      ) %>%

      hc_yAxis(enabled = FALSE,
               opposite = TRUE,
               tickAmount = 6,
               gridLineWidth = 0.5,
               gridLineColor = 'gray',
               gridLineDashStyle = "longdash",
               title = FALSE,
               labels = list(
                 align = 'left',
                 fontWeight = 'bold',
                 x = -20,
                 y = -3,
                 style = list(color =  'black',
                              fontWeight = "bold",
                              fontSize = '10px',
                              fontFamily = "Exo 2")
               ))%>%

      hc_credits(enabled = TRUE)%>%
      hc_plotOptions(series = list(borderRadius = 3.5,
                                   marker = list(enabled = FALSE),
                                   lineWidth = 2,
                                   shadow = TRUE,
                                   fillOpacity = 0.25
      ))


  })

  output$line_chart_3 <- renderHighchart({

    sample_2_colors <-  sample(c('#0F60D2', '#EF2D3E'),1)


    hchart(
      df_cards,
      "area",
      hcaes(x, y, color = colors),

      name = '',
      color = sample_2_colors,
      showInLegend = FALSE
    )  %>%
      hc_xAxis(
        title = NULL,
        gridLineWidth = 0,
        labels = list(format = "{value:%b - %Y}")
      ) %>%

      hc_yAxis(enabled = FALSE,
               opposite = TRUE,
               tickAmount = 6,
               gridLineWidth = 0.5,
               gridLineColor = 'gray',
               gridLineDashStyle = "longdash",
               title = FALSE,
               labels = list(
                 align = 'left',
                 fontWeight = 'bold',
                 x = -20,
                 y = -3,
                 style = list(color =  'black',
                              fontWeight = "bold",
                              fontSize = '10px',
                              fontFamily = "Exo 2")
               ))%>%

      hc_credits(enabled = TRUE)%>%
      hc_plotOptions(series = list(borderRadius = 3.5,
                                   marker = list(enabled = FALSE),
                                   lineWidth = 2,
                                   shadow = TRUE,
                                   fillOpacity = 0.25
      ))


  })

  output$line_chart_4 <- renderHighchart({

    sample_2_colors <-  sample(c('#0F60D2', '#EF2D3E'),1)


    hchart(
      df_cards,
      "area",
      hcaes(x, y, color = colors),

      name = '',
      color = sample_2_colors,
      showInLegend = FALSE
    )  %>%
      hc_xAxis(
        title = NULL,
        gridLineWidth = 0,
        labels = list(format = "{value:%b - %Y}")
      ) %>%

      hc_yAxis(enabled = FALSE,
               opposite = TRUE,
               tickAmount = 6,
               gridLineWidth = 0.5,
               gridLineColor = 'gray',
               gridLineDashStyle = "longdash",
               title = FALSE,
               labels = list(
                 align = 'left',
                 fontWeight = 'bold',
                 x = -20,
                 y = -3,
                 style = list(color =  'black',
                              fontWeight = "bold",
                              fontSize = '10px',
                              fontFamily = "Exo 2")
               ))%>%

      hc_credits(enabled = TRUE)%>%
      hc_plotOptions(series = list(borderRadius = 3.5,
                                   marker = list(enabled = FALSE),
                                   lineWidth = 2,
                                   shadow = TRUE,
                                   fillOpacity = 0.25
      ))


  })


}

options(shiny.autoreload = TRUE)


shinyApp(ui = ui, server = server)
