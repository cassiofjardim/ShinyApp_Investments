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

    @import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

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
                            style = 'margin:0px; background: #e7e7e9; ',
                            # fill_page = TRUE,
                            # auto_fill = TRUE,

                            rows = list(
                              default = ".1fr 1fr 1fr ",
                              md = ".1fr .5fr .5fr 1fr "

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
                                "cards_bottom cards_bottom  "
                              )


                            ),
                            gap = list(
                              default = "2em",
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
                              style = "background: whitesmoke;
                                       padding: 1em;
                                       border:1px solid lightgray",
                              div(
                                style = '
                                         display: flex;
                                         flex-direction: column;
                                         flex:1;',

                                h5('Hello  Hans, its good to be back',
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
                                              'Sync with Google Charts'))),
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
                                     h5('Current Portfolio',
                                        class = 'div_inputs_inline',
                                        style = 'position: relative;right:0;',
                                        pickerInput(
                                          inputId = "my_savings",width = 'fit',

                                          choices = c("My Savings")
                                        ),
                                        pickerInput(
                                          inputId = "add_instruments",width = 'fit',

                                          choices = c("Add Wallet")
                                        ),
                                        style = 'margin:.25em 0; padding: 1em; text-align:left;')
                                     # div(
                                     #   class = 'savings',
                                     #
                                     # pickerInput(
                                     #   inputId = "savings",
                                     #   label = "My Savings",
                                     #   choices = c("My savings")
                                     # )),
                                     #
                                     # div(
                                     #
                                     #   class = 'investments',
                                     #
                                     # pickerInput(
                                     #   inputId = "investments",
                                     #   label = "+ Add Wallets",
                                     #   choices = c("+ Add Wallets"),
                                     #   choicesOpt = list(
                                     #     icon = c("glyphicon-folder-close"))
                                     # ))
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
                                    h6('My Holding'),
                                    tags$ul(
                                      style = 'list-style: none;margin:0px; padding:0px',
                                      tags$li('$3.456.000,56',
                                              style = ' font-weight:900',
                                              tags$span('(+16.02%)',
                                                        style = 'font-size:.65em; color: green; font-weight:700')),
                                      tags$li(tags$span('This month, (+16.02%)',
                                                        style = 'font-size:.65em; color: green; font-weight:700'))

                                    )

                                  ),
                                  div(
                                    class = 'right_column',
                                    h6('My Revenue'),
                                    tags$ul(
                                      style = 'list-style: none;margin:0px; padding:0px',
                                      tags$li('$3.456.000,56',
                                              style = ' font-weight:900',
                                              tags$span('(+16.02%)',
                                                        style = 'font-size:.65em; color: green; font-weight:700')),
                                      tags$li(tags$span('This month, (+16.02%)',
                                                        style = 'font-size:.65em; color: green; font-weight:700'))

                                    )

                                  )


                                  )

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
                              h5('Chart Title'),
                              div(
                                class = 'inputs_left_right',
                                style = 'position: relative;',
                                # div(
                                #   class = 'savings',
                                #
                                # pickerInput(
                                #   inputId = "savings",
                                #   label = "My Savings",
                                #   choices = c("My savings")
                                # )),
                                #
                                # div(
                                #
                                #   class = 'investments',
                                #
                                # pickerInput(
                                #   inputId = "investments",
                                #   label = "+ Add Wallets",
                                #   choices = c("+ Add Wallets"),
                                #   choicesOpt = list(
                                #     icon = c("glyphicon-folder-close"))
                                # ))
                              ),
                              tags$div('',
                                       class = 'div_charts',
                                       style  ='height:400px;
                       gap:2em; border-radius: 5px;
                        display: flex;flex:1; background: white;',
                                       div(style = 'flex:.5;display:flex;flex-direction: column; justify-content: space-between;',
                                          tags$ul(
                                            'Average monthly revenues',

                                            style = 'list-style: none;
                                            margin:1em 0;
                                            padding:0px',
                                            tags$li(h4('$3.456.000,56',
                                                    style = ' font-weight:900; margin:1em 0; text-align: left;'),
                                                    tags$span('m/m: -545 (%78)',
                                                              style = 'font-size:.65em; color: green; font-weight:700')),
                                            tags$li(style = ' margin:1em 0',
                                                    tags$span('This month, (+16.02%)',
                                                              style = 'font-size:.65em; color: green; font-weight:700')),
                                            tags$li(style = ' margin:1em 0',
                                                    tags$span('This month, (+16.02%)',
                                                              style = 'font-size:.65em; color: green; font-weight:700'))),

                                            actionButton(inputId = 'modal',
                                                         style = '',
                                                         label =tags$img(src = "img/download.png",
                                                                         span("Download pdf report",
                                                                              style = 'font-size: .75em;
                                                           color: blue;font-weight: 600;'),
                                                                         width = '16px', height = '16px')

                                          )),
                                       div(
                                           h1('Chart'),
                                          style = 'flex:1;background: lightblue')
                              )

                            ),
                            # - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  - - -  -

                            div(
                              class = "cards_bottom",
                              style = "flex:1; height:370px",
                              h5('Investments Radar',
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
                              style = 'margin:.25em 0; padding: 1em; text-align:left;'),
                              flexPanel(
                                style  ='height: 300px; background: transparent;padding:1em;',
                                id = 'top_cards',
                                wrap = "wrap",
                                # justify_content = 'space-AROUND',
                                # align_items = 'center',
                                gap = '2em',flex = '300px',

                                div(
                                    style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                    tags$ul(
                                      style = 'list-style: none;padding:0px',
                                      tags$li(tags$span('PKO (PKOB)', style = 'font-weight:700;')),
                                      tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                    ),
                                    tags$ul(
                                      style = 'list-style: none;padding:0px',
                                      tags$li(tags$span('PKO (PKOB)', style = 'font-weight:700;')),
                                      tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                    )

                                    ),
                                div(
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CAT.US', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                  ),
                                  tags$ul(
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('PKO (PKOB)', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                  )

                                ),
                                div(
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CAT.US', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                  ),
                                  tags$ul(
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('KGH (KGHM)', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                  )

                                ),
                                div(
                                  style = 'background: white;padding:.5em;
                                    display:flex;flex-wrap: wrap; gap:2em;justify-content: space-between',

                                  tags$ul(
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CAT.US', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                  ),
                                  tags$ul(
                                    style = 'list-style: none;padding:0px',
                                    tags$li(tags$span('CDR (CDPROJEXT)', style = 'font-weight:700;')),
                                    tags$li(tags$span('updated: 10:35am', style = 'font-size:.75em; color:gray'))

                                  )

                                )


                              )
                            )
                          )),
                 tabPanel("WaitLists"),
                 tabPanel("IPO"),
                 tabPanel("Analysts")

)

server <- function(input, output, session) {}

options(shiny.autoreload = TRUE)


shinyApp(ui = ui, server = server)
