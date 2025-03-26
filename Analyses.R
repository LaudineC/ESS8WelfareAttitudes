### RAW ESTIMATES ###

# Beliefs in the gov 
hist(ESSFr$ChildcareGovernment, 
     main = "Belief in the government should provide childcare",
     xlab = "Government Responsibility \n(0 : No responsibility; 10 : full)", 
     col = "lightblue", 
     border = "black")

# Plot the support for work-family life
ESSFr %>% filter(!is.na(SupportForWorkFamilyLife)) %>% 
ggplot( aes(x = SupportForWorkFamilyLife)) +
  geom_bar(fill = "lightblue", color = "black") +
  labs(title = "Support for work-family life policies",
       x = "Support",
       y = "Frequency") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
