install.packages("leaflet")
library(ggplot2)
library(leaflet)
library(devtools)
library(dplyr)
library(forcats)
library(tidyverse)
library(streamgraph)
library(viridis)
library(hrbrthemes)
library(plotly)

GDPData<-read.csv(file.choose(), header = TRUE)
GVAData<-read.csv(file.choose(), header = TRUE)
EduData<-read.csv(file.choose(), header = TRUE)
GVADatask<-read.csv(file.choose(), header = TRUE)

summary(EduData)
EduData <- na.omit(EduData)

##
EduRegions <- EduData[ which((EduData$Region.Country.Area == 'Northern Africa' |
                                EduData$Region.Country.Area == 'Sub-Saharan Africa' |
                                EduData$Region.Country.Area == 'Northern America' |
                                EduData$Region.Country.Area == 'Latin America & the Caribbean' |
                                EduData$Region.Country.Area == 'Eastern Asia' |
                                EduData$Region.Country.Area == 'South-eastern Asia' |
                                EduData$Region.Country.Area == 'Southern Asia' |
                                EduData$Region.Country.Area == 'Western Asia' |
                                EduData$Region.Country.Area == 'Europe') & EduData$Year == '2017' ), ]
EduReg <- EduRegions[, 2:4]
EduReg <- EduReg[, -2]
plot(EduReg)
par(mar=c(5,6,4,2)+0.1)
barplot(height=EduReg$Students.enrolled.in.primary.education..thousands.* 0.001, names=EduReg$Region.Country.Area,
        las=2, cex.names=.5,
        col=rgb(0.8,0.1,0.1,0.6),
        ylab="Enrollment in Millions", 
        main="Enrollment in 2017 by Region", 
        ylim=c(0,250)
)

GDPRegions <- GDPData[ which((GDPData$Region.Country.Area == 'Africa' |
                                GDPData$Region.Country.Area == 'Northern America' |
                                GDPData$Region.Country.Area == 'Latin America & the Caribbean' |
                                GDPData$Region.Country.Area == 'South America' |
                                GDPData$Region.Country.Area == 'Asia' |
                                GDPData$Region.Country.Area == 'Europe') & GDPData$Year >= 2000), ]

ggplot(GDPRegions, aes(x=GDPRegions$Region.Country.Area, y=GDPRegions$GDP.in.current.prices..millions.of.US.dollars.)) + 
  geom_bar(stat = "identity") +
  labs(title="GDP of Global regions in Trillions of USD",y="USD",x="Region")+
  coord_flip()

ggplot(GDPRegions, aes(x=GDPRegions$Year, y=GDPRegions$GDP.per.capita..US.dollars., color=GDPRegions$Region.Country.Area)) +
  geom_line() +
  scale_color_viridis(discrete = TRUE) +
  theme(legend.position="none") +
  labs(title="GDP per Capita of global regions over time",y="USD",x="Region")+
  theme_ipsum()

ggplot(GDPRegions, aes(x=GDPRegions$Year, y=GDPRegions$GDP.per.capita..US.dollars., group=GDPRegions$Region.Country.Area, fill=GDPRegions$Region.Country.Area)) +
  geom_area() +
  scale_fill_viridis(discrete = TRUE) +
  theme(legend.position="none") +
  labs(title="GDP per Capita of global regions over time",y="USD",x="Region")+
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8),
    plot.title = element_text(size=14)
  ) +
  facet_wrap(~GDPRegions$Region.Country.Area)

IndiaGVAData  <- GVADatask[ which(GVADatask$X=='India'), ]
ChinaGVAData  <- GVADatask[ which(GVADatask$X=='China'), ]
USAGVAData  <- GVADatask[ which(GVADatask$X=='United States of America'), ]
SyrianGVAData  <- GVADatask[ which(GVADatask$X=='Syrian Arab Republic'), ]
GreeceGVAData  <- GVADatask[ which(GVADatask$X=='Greece'), ]
LiberiaGVAData  <- GVADatask[ which(GVADatask$X=='Liberia'), ]

ggplot(IndiaGVAData, aes(x=IndiaGVAData$Year, y=IndiaGVAData$Value, fill=IndiaGVAData$Series)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Value added by Indian Sectors",y="Percentage of GDP",x="Year")

ggplot(ChinaGVAData, aes(x=ChinaGVAData$Year, y=ChinaGVAData$Value, fill=ChinaGVAData$Series)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Value added by Chinese Sectors",y="Percentage of GDP",x="Year")

ggplot(USAGVAData, aes(x=USAGVAData$Year, y=USAGVAData$Value, fill=USAGVAData$Series)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Value added by American Sectors",y="Percentage of GDP",x="Year")

ggplot(SyrianGVAData, aes(x=SyrianGVAData$Year, y=SyrianGVAData$Value, fill=SyrianGVAData$Series)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Value added by Syrian Sectors",y="Percentage of GDP",x="Year")

ggplot(GreeceGVAData, aes(x=GreeceGVAData$Year, y=GreeceGVAData$Value, fill=GreeceGVAData$Series)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Value added by Greek Sectors",y="Percentage of GDP",x="Year")

ggplot(LiberiaGVAData, aes(x=LiberiaGVAData$Year, y=LiberiaGVAData$Value, fill=LiberiaGVAData$Series)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Value added by Liberian Sectors",y="Percentage of GDP",x="Year")

ggplot(GVAData, aes(x=GVAData$Agriculture..hunting..forestry.and.fishing....of.gross.value.added., y=GVAData$Services....of.gross.value.added.)) +
  geom_hex(bins = 40) +
  scale_fill_viridis(option="E") +
  theme_bw()

ggplot(GVAData, aes(x=GVAData$Industry....of.gross.value.added., y=GVAData$Services....of.gross.value.added.)) +
  geom_hex(bins = 40) +
  scale_fill_viridis(option="E") +
  theme_bw()

## Heatmap

YearGDPData <- GDPData[ which(GDPData$Year=="2016"), ]
YearGDPData <- YearGDPData[, -1]
GDPHeatmap <- YearGDPData[,-2]
rownames(GDPHeatmap) <- YearGDPData[,2]
GDPHeatmap <- as.matrix(GDPHeatmap)
heatmap(GDPHeatmap)

##