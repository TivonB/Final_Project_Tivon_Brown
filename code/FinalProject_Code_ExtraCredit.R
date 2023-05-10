violations <- trf_stops %>%
  count(county_name, violation)

violations

violations %>% pivot_wider(names_from = violation, values_from = n)

