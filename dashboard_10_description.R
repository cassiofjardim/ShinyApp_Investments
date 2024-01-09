link_tag_10 <-
  tags$a(
    tags$img(src = 'img/link_logo.svg'),
    href = 'https://cfjardim.shinyapps.io/MidjourneyImageApp/',
    'https://cfjardim.shinyapps.io/MidjourneyImageApp/',
    style = 'display:inline-block;
         margin: 10px 0;color: blue;'
  ) 


project_introduction_function <-
  function(title,
           paragraph_1,
           paragraph_2,
           paragraph_3,
           chalenges_lists_div,
           ...) {
    div(class = "project_introduction",
        title,
        paragraph_1,
        paragraph_2,
        paragraph_3,
        chalenges_lists_div)
  }

descritption_10 <- project_introduction_function(
  title = " ",
  paragraph_1 = p(a("Blog with Shiny. Why not?'", href = ''),
                  ''),
  paragraph_2 = p(""),
  paragraph_3 = p(""),
  
  chalenges_lists_div <- div(class = 'chalenges_lists_div',
                             tags$ul(
                               tags$li("Data Visualization:"),
                               tags$li(" User Interface:"),
                               tags$li(
                                 " Interactivity:
The interactivity is enabled via the date selection widget, allowing the user to see the four graphs for the selected date. An enterprise-created javascript library with interactive graphics is part of the highcharter bundle (https://www.highcharts.com/)"
                               ),
                               tags$li(" Upcoming work:
")
                             ))
  
)

packages_technologies_10 <-
  div(
    tags$img(src = 'img/shiny.jpg', height = 100),
    tags$img(
      src = 'img/highchartr.png',
      width = 80,
      height = 90
    ),
    tags$img(
      src = 'img/reactable.png',
      width = 80,
      height = 90
    ),
    tags$img(
      src = 'img/renv_logo.png',
      width = 80,
      height = 90
    ),
    tags$img(
      src = 'img/html_svg.png',
      width = 80,
      height = 90
    ),
    tags$img(
      src = 'img/css_svg.png',
      width = 80,
      height = 90
    ),
    
  )

dash_10_list_infos <- list(
  dashboard_inputId = 10,
  modal_title = 'Image WebApp consulting (Similar to Pintrest)',
  tabset_id = '10',
  dash_position = 10,
  link_a_tag_dashboard = link_tag_10,
  img_path_dashboard_png = 10,
  project_description = descritption_10,
  packages_technologies = packages_technologies_10
)
