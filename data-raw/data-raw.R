library(dplyr)
library(tidyr)
library(devtools)

Text <- "Class,1,2,3,4,5,6
Eye,Does not open eyes,Opens eyes in response to painful stimuli,Opens eyes in response to voice,Opens eyes spontaneously,N/A,N/A
Verbal,Makes no sounds,Incomprehensible sounds,Utters incoherent words,Confused disoriented,Oriented converses normally,N/A
Motor,Makes no movements,Extension to painful stimuli (decerebrate response),Abnormal flexion to painful stimuli (decorticate response),Flexion / Withdrawal to painful stimuli,Localizes painful stimuli,Obeys commands
"

rawgcs <- read.csv(textConnection(Text)) %>%
    gather(Score, Value, X1:X6) %>%
    arrange(Class) %>%
    mutate(Score = as.numeric(sub("X", "", Score))) %>%
    filter(Value != "N/A")

glasgowComaScale <- rawgcs %>% mutate(ID = paste0(substr(Class, 1, 1), Score)) %>%
  select(ID, Class, Score, Value)

write.csv(glasgowComaScale, "data-raw/glasgowComaScale.csv", row.names = FALSE)
