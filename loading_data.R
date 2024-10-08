# Get form submissions
submissions <- ruODK::odata_submission_get()

# View the data
current_date <- Sys.Date()

# Get up the submissions for the date today
submissions_df <- submissions %>%
  mutate(today_sub = ifelse(as.Date(submissions$start) == current_date, 1, 0))

# today_sub == 1  "New submissions for DCCMS today"

#2. So remote stations submitting daily data can see data they've previously sent;
# ADMIN + PASSWORD PAGE

#3. And possibly to make (1) available to remote stations to encourage friendly competition in submitting daily data to head office!
# submissions_df_table <- submissions_df %>%
#   group_by(selected_station) %>%
#   summarise(`total rain` = sum(precipitation_mm),
#             `min temp` = min(minimum_temperature_c),
#             `max temp` = max(maximum_temperature_c)) %>%
#   pivot_longer(cols = c(`total rain`, `min temp`, `max temp`))
# 
# 
# 
# ggplot(submissions_df_table) + geom_bar(aes(x = selected_station, y = value), stat = "identity") + theme_minimal() + labs(x = "Station", y = "Submissions Today") + facet_wrap(vars(name), nrow = 2, scales = "free_y")

# filter is a global option to filter to a specific date for submissions_df


##############

# 
# submissions_df <- function(){
#   ruODK::ru_setup(
#     svc = "https://odk.idems.international/v1/projects/5/forms/DCCMS%20manual%20stations%20daily%20-%20June%202024.svc",
#     un = "lily@idems.international",
#     pw = "eatwanderrule",
#     verbose = TRUE
#   )
#   
#   # Get form submissions
#   submissions <- ruODK::odata_submission_get()
#   
#   # New submissions today:
#   submissions_df <- submissions %>%
#     mutate(today_sub = ifelse(as.Date(submissions$system_submission_date) == current_date, 1, 0))
#   
#   # today_sub == 1  "New submissions for DCCMS today"
#   
#   #2. So remote stations submitting daily data can see data they've previously sent;
#   # ADMIN + PASSWORD PAGE
#   
#   #3. And possibly to make (1) available to remote stations to encourage friendly competition in submitting daily data to head office!
#   return(submissions_df)
# }
# 
# submissions_df_table <- submissions_df %>% group_by(selected_station) %>% summarise(inputted_today = as.integer(sum(today_sub)))
