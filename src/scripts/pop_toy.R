library(tidyverse)

# Consider the following questions
# Variable              Question Text
# 
# dishonest             Most police in my neighborhood are dishonest
# unequal_treatment     Most police treat some people better than others
# job_well              Most police do their job well
# respect               Most police treat people with respect
# fair_treatment        I can count on police to treat me fairly and with respect
# out_to_get_me         I often feel the police are out to get me
# avoid_police          I try to avoid situations where I might encounter the police
# enemy                 The police and the courts often treat me like the enemy
# angry_guilty_free     It makes me angry when guilty people go free

pop_toy <- tribble(
  ~respondent_id, ~dishonest, ~unequal_treatment, ~job_well, ~respect, ~fair_treatment, ~out_to_get_me, ~avoid_police, ~enemy, ~angry_guilty_free,
  1,  "Strongly disagree", "Disagree",          "Strongly agree", "Strongly agree", "Strongly agree", "Strongly disagree", "Strongly disagree", "Strongly disagree", "Strongly agree",
  2,  "Disagree",          "Disagree",          "Agree",          "Agree",          "Agree",          "Disagree",          "Disagree",          "Disagree",          "Agree",
  3,  "Strongly disagree", "Neither agree nor disagree", "Agree", "Agree", "Agree", "Disagree", "Neither agree nor disagree", "Disagree", "Strongly agree",
  4,  "Disagree",          "Strongly disagree", "Strongly agree", "Agree", "Strongly agree", "Strongly disagree", "Disagree", "Strongly disagree", "Agree",
  5,  "Agree",             "Agree",             "Disagree",       "Disagree",       "Disagree",       "Agree",             "Agree",             "Agree",             "Strongly agree",
  6,  "Strongly agree",    "Agree",             "Strongly disagree", "Disagree",    "Strongly disagree", "Strongly agree", "Strongly agree", "Agree", "Agree",
  7,  "Agree",             "Strongly agree",    "Neither agree nor disagree", "Disagree", "Disagree", "Agree", "Strongly agree", "Agree", "Strongly agree",
  8,  "Neither agree nor disagree", "Agree", "Agree", "Neither agree nor disagree", "Agree", "Neither agree nor disagree", "Agree", "Neither agree nor disagree", "Agree",
  9,  "Disagree",          "Agree",             "Agree",          "Agree",          "Neither agree nor disagree", "Disagree", "Agree", "Disagree", "Strongly agree",
  10, "Agree",             "Neither agree nor disagree", "Disagree", "Neither agree nor disagree", "Disagree", "Agree", "Neither agree nor disagree", "Agree", "Agree",
  11, "Neither agree nor disagree", "Neither agree nor disagree", "Neither agree nor disagree", "Agree", "Neither agree nor disagree", "Disagree", "Disagree", "Neither agree nor disagree", "Agree",
  12, "Disagree",          "Disagree",          "Neither agree nor disagree", "Agree", "Agree", "Agree", "Agree", "Neither agree nor disagree", "Strongly agree",
  13, "Strongly agree",    "Strongly agree",    "Disagree",       "Strongly disagree", "Disagree", "Strongly agree", "Agree", "Strongly agree", "Neither agree nor disagree",
  14, "Disagree",          "Agree",             "Strongly agree", "Agree", "Agree", "Neither agree nor disagree", "Disagree", "Disagree", "Agree",
  15, "Agree",             "Agree",             "Agree",          "Disagree",       "Neither agree nor disagree", "Agree", "Agree", "Neither agree nor disagree", "Strongly agree"
)
