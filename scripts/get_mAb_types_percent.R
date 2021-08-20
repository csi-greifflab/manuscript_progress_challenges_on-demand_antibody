# Downloaded Approved-antibody-therapeutics_as-of-July-10-2021.xlsx from the Antibody society website (https://www.antibodysociety.org/antibody-therapeutics-product-data/) 
# Accessed on 19th July 2021
# Created by: Habib Bashour

library(tidyverse)
library(readxl)
library(janitor)
read_xlsx("Approved-antibody-therapeutics_as-of-July-10-2021.xlsx") %>%
  clean_names() %>%
  separate(target_format, c("target", "format"), sep = "; ") %>%
  mutate(format = str_remove_all(format, " .*")) %>%
  mutate(format = str_replace_all(format, "human", "Human")) %>%
  mutate(format = str_replace_all(format, "humanized", "Humanized")) %>%
  mutate(format = str_replace_all(format, "Muine", "Murine")) %>%
  group_by(format) %>%
  summarise(n = n()) %>%
  mutate(proportion = n/sum(n)*100)
