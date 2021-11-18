test_that("Testing all error throw situations", {

  #missing input variable error
  expect_error(summaryInfoCal())

  #data frame input error
  expect_error(summaryInfoCal(1, "max", "body_mass_g", "sex"))

  #cal_type input error
  expect_error(summaryInfoCal(palmerpenguins::penguins, 1, "body_mass_g", "sex"))

  #cal_type input not in max, min, mean, median, standard deviation error
  expect_error(summaryInfoCal(palmerpenguins::penguins, "maxa", "body_mass_g", "sex"))

  #col_name input error
  expect_error(summaryInfoCal(palmerpenguins::penguins, "max", "island", "sex"))

  #category input error
  expect_error(summaryInfoCal(palmerpenguins::penguins, "max", "body_mass_g", "year"))

  #NA input error
  expect_error(summaryInfoCal(palmerpenguins::penguins, "max", NA, "year"))
})


test_that("Testing function result", {

  exp_max_res <- palmerpenguins::penguins %>%
    tidyr::drop_na(sex) %>%
    dplyr::group_by(sex) %>%
    dplyr::summarise(max = max(body_mass_g, na.rm = TRUE))

  act_max_res = summaryInfoCal(palmerpenguins::penguins, "max", "body_mass_g", "sex")


  exp_min_res <- palmerpenguins::penguins %>%
    tidyr::drop_na(sex) %>%
    dplyr::group_by(sex) %>%
    dplyr::summarise(min = min(body_mass_g, na.rm = TRUE))

  act_min_res = summaryInfoCal(palmerpenguins::penguins, "min", "body_mass_g", "sex")


  exp_mean_res <- palmerpenguins::penguins %>%
    tidyr::drop_na(sex) %>%
    dplyr::group_by(sex) %>%
    dplyr::summarise(mean = mean(body_mass_g, na.rm = TRUE))

  act_mean_res = summaryInfoCal(palmerpenguins::penguins, "mean", "body_mass_g", "sex")


  exp_median_res <- palmerpenguins::penguins %>%
    tidyr::drop_na(sex) %>%
    dplyr::group_by(sex) %>%
    dplyr::summarise(median = median(body_mass_g, na.rm = TRUE))

  act_median_res = summaryInfoCal(palmerpenguins::penguins, "median", "body_mass_g", "sex")


  exp_sd_res <- palmerpenguins::penguins %>%
    tidyr::drop_na(sex) %>%
    dplyr::group_by(sex) %>%
    dplyr::summarise(sd = sd(body_mass_g, na.rm = TRUE))

  act_sd_res = summaryInfoCal(palmerpenguins::penguins, "sd", "body_mass_g", "sex")

  # test the ouput type
  expect_true(is.data.frame(act_max_res))

  #test the max calculation
  expect_equal(exp_max_res, act_max_res)

  #test the min calculation
  expect_equal(exp_min_res, act_min_res)

  #test the mean calculation
  expect_equal(exp_mean_res, act_mean_res)

  #test the median calculation
  expect_equal(exp_median_res, act_median_res)

  #test the standard deviation calculation
  expect_equal(exp_sd_res, act_sd_res)
})
