trf_stops <- read_csv("../data/original/MS_trafficstops_bw_age.csv")

str(trf_stops)
spec(trf_stops)

trf_stops %>% dplyr::select('police_department', 'officer_id', 'driver_race')

trf_stops %>% dplyr::select(starts_with("driver"))
trf_stops %>% dplyr::select(ends_with("er"))

trf_stops %>% slice_min(driver_age)
trf_stops %>% slice_max(driver_age)

trf_stops %>% dplyr::arrange(county_name, stop_date)

trf_stops %>%
  dplyr::filter(driver_age > 85) %>%
  dplyr::select(violation, driver_gender)

trf_stops %>%
  dplyr::filter(driver_race  == "Black") %>%
  dplyr::select(officer_id, stop_date)

#Filtering for officer id D003
trf_stops %>%
  dplyr::filter(officer_id == "D003") %>%
  dplyr::select(officer_id , stop_date)

#Filtering for Black and officer id D003
trf_stops %>%
  dplyr::filter(driver_race  == "Black", officer_id == "D003") %>%
  dplyr::select(officer_id , stop_date)

#Filtering for white and officer id D003
trf_stops %>%
  dplyr::filter(driver_race  == "White", officer_id == "D003") %>%
  dplyr::select(officer_id , stop_date)

trf_stops %>%
  dplyr::filter(county_name  == "Tunica") %>%
  dplyr::select(stop_date, driver_age, violation)

#average age
trf_stops %>%
  dplyr::filter(driver_race  !=  "NA") %>%
  dplyr::group_by(county_name, driver_race) %>%
  dplyr::summarise(mean_driver_age = mean(driver_age, na.rm = TRUE))

#minimum age
trf_stops %>%
  dplyr::filter(driver_race  !=  "NA") %>%
  dplyr::group_by(county_name, driver_race) %>%
  dplyr::summarise(mean_driver_age = min(driver_age, na.rm = TRUE))

trf_stops %>%
  count(officer_id, name = "n_stops") # the result will be stored under variable n_stops

trf_stops %>%
  count(officer_id, name = "n_stops", sort = TRUE)

trf_stops %>%
  count(officer_id, violation, name = "n_stops", sort = TRUE)