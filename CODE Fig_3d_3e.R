library(ggplot2)
install.packages("wesanderson")
library(wesanderson)
geom.text.size = 3

# 1/ add text with geom_text, use nudge to nudge the text
ggplot(FDC, aes(x=ID, y=ddG, color=FERM)) +
  geom_point() + # Show dots
  geom_text(
    label=FDC$Mutation,
    nudge_x = 0.25, nudge_y = 0.25, size=geom.text.size,
    check_overlap = T
  )+
  theme_bw()+
  theme(axis.line = element_line(colour = "black"),
        axis.text.y = element_text(size = 8))+
  geom_hline(yintercept=0, linetype="dashed",
               color = "red", size=1)+
  scale_color_manual(values=rev(wes_palette(n=3, name="Cavalcanti1")))

library(ggplot2)
install.packages("wesanderson")
library(wesanderson)
geom.text.size = 3

# 1/ add text with geom_text, use nudge to nudge the text
ggplot(FTC, aes(x=ID, y=ddG, color=FERM)) +
  geom_point() + # Show dots
  geom_text(
    label=FTC$Mutation,
    nudge_x = 0.25, nudge_y = 0.25, size=geom.text.size,
    check_overlap = T
  )+
  theme_bw()+
  theme(axis.line = element_line(colour = "black"),
        axis.text.y = element_text(size = 8))+
  geom_hline(yintercept=0, linetype="dashed",
               color = "red", size=1)+
  scale_color_manual(values=rev(wes_palette(n=3, name="Cavalcanti1")))
