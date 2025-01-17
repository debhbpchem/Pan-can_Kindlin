library(readr)
K1 <- read_csv("C:/Users/HP/Downloads/FERMT1 ddG ddS (1).csv")
View(K1)

library(dplyr)
K1_MOD <- K1 %>% rename("Mutation"="WT - Residue - Mutant", "ddG"="??G [kcal/mol]", "ddS"="??S [kcal.mol-1.K-1]")
K1_new=subset(K1_MOD, select = c(Mutation, ddG, ddS))
K1_new1<-K1_new[c(1:81, 83:194), ]
library(ggplot2)
x_mid <- mean(c(max(K1_new1$ddS, na.rm = TRUE),
                min(K1_new1$ddS, na.rm = TRUE)))

y_mid <- mean(c(max(K1_new1$ddG, na.rm = TRUE),
                min(K1_new1$ddG, na.rm = TRUE)))
K1_new1 %>% mutate(quadrant = case_when(ddS > 0 & ddG > 0   ~ "Q1",
                            ddS < 0 & ddG > 0  ~ "Q2",
                            ddS < 0 & ddG < 0 ~ "Q3",
                            TRUE                                         ~ "Q4")) %>%
  ggplot (aes(x = ddS, y=ddG, color = quadrant)) +
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  xlim(-2, 2) +
  ylim(-2.5, 2.5) +
  geom_point(alpha = 10) +
  geom_smooth(method = "lm", color="grey", fullrange=TRUE) +
  theme(axis.text.y   = element_text(size=14),
         axis.text.x   = element_text(size=14),
         axis.title.y  = element_text(size=14),
         axis.title.x  = element_text(size=14),
         panel.background = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.line = element_line(colour = "black"),
         panel.border = element_rect(colour = "black", fill=NA, size=0.5))

library(readr)
K2 <- read_csv("C:/Users/HP/Downloads/FERMT2 ddG ddS (1).csv")
View(K2)

K2_MOD <- K2 %>% rename("Mutations"="WT - Residue - Mutant", "ddG"="??G [kcal/mol]", "ddS"="??S [kcal.mol-1.K-1]")
K2_new=subset(K2, select = c(Mutations, ddG, ddS))
library(ggplot2)
x_mid <- mean(c(max(K2_new$ddS, na.rm = TRUE),
                min(K2_new$ddS, na.rm = TRUE)))

y_mid <- mean(c(max(K2_new$ddG, na.rm = TRUE),
                min(K2_new$ddG, na.rm = TRUE)))
K2_new %>% mutate(quadrant = case_when(ddS > 0 & ddG > 0   ~ "Q1",
                                        ddS < 0 & ddG > 0  ~ "Q2",
                                        ddS < 0 & ddG < 0 ~ "Q3",
                                        TRUE                                         ~ "Q4")) %>%
  ggplot (aes(x = ddS, y=ddG, color = quadrant)) +
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  xlim(-2, 2) +
  ylim(-2.5, 2.5) +
  geom_point(alpha = 10) +
  geom_smooth(method = "lm", color="grey", fullrange=TRUE) +
  theme(axis.text.y   = element_text(size=14),
        axis.text.x   = element_text(size=14),
        axis.title.y  = element_text(size=14),
        axis.title.x  = element_text(size=14),
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=0.5))

library(readr)
K3 <- read_csv("C:/Users/HP/Downloads/FERMT3 ddG ddS.csv")
View(K3)

K3_MOD <- K3 %>% rename("ddG"="ddg")
K3_new=subset(K3_MOD, select = c(Mutations, ddG, ddS))
library(ggplot2)
x_mid <- mean(c(max(K3_new$ddS, na.rm = TRUE),
                min(K3_new$ddS, na.rm = TRUE)))

y_mid <- mean(c(max(K3_new$ddG, na.rm = TRUE),
                min(K3_new$ddG, na.rm = TRUE)))
K3_new %>% mutate(quadrant = case_when(ddS > 0 & ddG > 0   ~ "Q1",
                                       ddS < 0 & ddG > 0  ~ "Q2",
                                       ddS < 0 & ddG < 0 ~ "Q3",
                                       TRUE                                         ~ "Q4")) %>%
  ggplot (aes(x = ddS, y=ddG, color = quadrant)) +
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  xlim(-2, 2) +
  ylim(-2.5, 2.5) +
  geom_point(alpha = 10) +
  geom_smooth(method = "lm", color="grey", fullrange=TRUE) +
  theme(axis.text.y   = element_text(size=14),
        axis.text.x   = element_text(size=14),
        axis.title.y  = element_text(size=14),
        axis.title.x  = element_text(size=14),
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=0.5))
