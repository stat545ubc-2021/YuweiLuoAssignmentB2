#'@title Summary Information Calculator
#'
#'This function calculate the Tibble or data frame column summary information(max, min, mean, median, standard deviation)
#'
#'@importFrom magrittr "%>%"
#'
#'@param data Tibble or data frame that you want to select from
#'@param cal_type determine summary method(max, min, mean, median, standard deviation) need be used for calculation.
#'@param col_name determine column need be calculated
#'@param category determine group by column
#'@param rem_na determine ignore or not ignore NA value in col_name column(default value True)
#'
#'@return data Tibble or data frame includes summary information for col_name input based on category input
#'
#'@export



summaryInfoCal <- function(df, cal_type, col_name, category, rem_na = TRUE){

  if(missing(df) || missing(cal_type) || missing(col_name) || missing(category)){
    stop('I am so sorry, some of function arguments is/are missing, need specify four arguments\n')
  }

  if(is.na(df) || is.na(cal_type) || is.na(col_name) || is.na(category)){
    stop('I am so sorry, some of function arguments is/are NA, need specify four arguments\n')
  }

  if(!is.data.frame(df)){
    stop('I am so sorry, but this function 1st argument only works for data frame type input!\n',
         'You have provided an data frame of class: ', class(df), '. please fix it!')
  }

  if(!is.character(cal_type)){
    stop('I am so sorry, but this function 2nd argument only works for character!\n',
         'You have provided an method of class: ', class(cal_type), '. please fix it!')
  }

  if(!is.numeric(df[[col_name]])){
    stop('I am so sorry, but this function 3rd argument only works for numeric column!\n',
         'You have provided an column of class: ', class(df[[col_name]]), '. please fix it!')
  }

  if(!(is.factor(df[[category]]) || is.character(df[[category]]))){
    stop('I am so sorry, but this function 4th argument only works for factor column or character column!\n',
         'You have provided an column of class: ', class(df[[category]]), '. please fix it!')
  }

  category = as.name(category)
  col_name = as.name(col_name)

  if(cal_type == "max"){
    res <- df %>%
      tidyr::drop_na(!!category) %>%
      dplyr::group_by(!!category) %>%
      dplyr::summarise(max = max(!!col_name, na.rm = rem_na))
    return(res)
  }

  else if(cal_type == "min"){
    res <- df %>%
      tidyr::drop_na(!!category) %>%
      dplyr::group_by(!!category) %>%
      dplyr::summarise(min = min(!!col_name, na.rm = rem_na))
    return(res)
  }

  else if(cal_type == "mean"){
    res <- df %>%
      tidyr::drop_na(!!category) %>%
      dplyr::group_by(!!category) %>%
      dplyr::summarise(mean = mean(!!col_name, na.rm = rem_na))
    return(res)
  }

  else if(cal_type == "median"){
    res <- df %>%
      tidyr::drop_na(!!category) %>%
      dplyr::group_by(!!category) %>%
      dplyr::summarise(median = median(!!col_name, na.rm = rem_na))
    return(res)
  }

  else if(cal_type == "sd"){
    res <- df %>%
      tidyr::drop_na(!!category) %>%
      dplyr::group_by(!!category) %>%
      dplyr::summarise(sd = sd(!!col_name, na.rm = rem_na))
    return(res)
  }

  else{
    stop('I am so sorry, but this function 2nd argument only support following input: max(maximum), min(minimum), mean(mean), median(median), sd(standard deviation)')
  }

}
