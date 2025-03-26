# Import ESS data

ESS <- read_csv(here("Data","ESS8e02_3.csv")) 

# Filter French respondents
ESSFr <- ESS %>% 
  filter(cntry == "FR") %>% 
  select(-cntry) 

# Recode

ESSFr <- ESSFr %>% 
  mutate(
    ChildcareGovernment = case_when(
      gvcldcr == 99 ~ NA, # 1 indiv
      gvcldcr == 88 ~ NA,  # 9 indiv
      gvcldcr == 77 ~ NA, # 1 indiv
      TRUE ~ as.numeric(gvcldcr)
      ), 
SupportForWorkFamilyLife = case_when(
  wrkprbf == 9 ~ NA, # 74 indiv
  wrkprbf == 7 ~ NA,  # 5 indiv
  wrkprbf == 1 ~ "Strongly against", 
  wrkprbf == 2 ~ "Against", 
  wrkprbf == 3 ~ "In favour",
  wrkprbf == 4 ~ "Strongly in favour"
  ), 
SupportForWorkFamilyLife = factor(SupportForWorkFamilyLife, 
                                  levels = c("Strongly against", "Against", "In favour", "Strongly in favour"),
                                  ordered = TRUE
                                  ),
Support50LessPay = case_when(
  wrkprbf == 9 ~ NA, # 9 indiv
  wrkprbf == 8 ~ NA, # 10 indiv
  wrkprbf == 7 ~ NA,  # 5 indiv
  wrkprbf == 6 ~ NA, # 1551 indiv: this is "Not applicable, idk why it is that much
  wrkprbf == 1 ~ "Strongly against", 
  wrkprbf == 2 ~ "Against", 
  wrkprbf == 3 ~ "In favour",
  wrkprbf == 4 ~ "Strongly in favour"
  ),
  
)

