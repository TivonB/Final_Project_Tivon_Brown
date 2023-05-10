tot_pop <- read_csv("../data/original/MS_acs2015_bw.csv")

str(tot_pop)
spec(tot_pop)

trf_stops %>% 
  count(county_name, name = "n_stops") 

trf_stops %>% left_join(tot_pop, by=c('county_name' = 'County')) %>%
  count(county_name, name = "n_stops", FIPS, black_pop, white_pop, bw_pop)