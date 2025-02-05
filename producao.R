if (!require("pacman")) install.packages("pacman")
pacman::p_load(raster,sf,exactextractr,viridis,tidyverse,geobr,
ggspatial,showtext,rayshader)

#add font
font_add_google("Open Sans", "open")
showtext_auto()
#----------------------------------------------------------------------------------------------------
#                                   MAPA DE PRODUÇÃO
br<-read_state(code_state = "all", year= 2010)
abbrev_state<-c("RO","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB",
                "PE","AL","SE","BA","MG","ES","RJ","SP","PR","SC","RS","MS",
                "MT","GO","DF")
toneladas<-c(2115,20,90616,2749,1595455,0,647,2478,0,402,
             0,0,17,110,0,4530,0,413,0,0,0,0,0,0,36,0,0)
producao<-data.frame(abbrev_state,toneladas)
acaiBR<-merge(br,producao)
ggplot(acaiBR) + aes(group = abbrev_state) +
  geom_sf(aes(fill = toneladas)) +  
  labs(x = "Longitute", y = "Latitude", title  = "Quantidade de Açaí produzido no Brasil (2022)") +
  theme_map()+scale_fill_distiller(n= "Toneladas(t):",palette = "BuPu", direction = 1)+ guides(col = FALSE)+theme(legend.title = element_blank())+ annotation_north_arrow(style = north_arrow_fancy_orienteering)+
  annotation_scale(location="bl",height = unit(0.1,"cm"))+
  theme_bw()
#----------------------------------------------------------------------------------------------------
#                  CONDIÇÃO DE PRODUÇÃO

prec <- getData('worldclim', var='prec', res=10)
PA <- read_municipality(code_muni = "PA", year = 2020, showProgress = F)
Precpa <- cbind(PA, exact_extract(prec, PA, c('mean'), progress=F))
precpa <- precpa %>% mutate(total = mean.prec1 + mean.prec2 + mean.prec3 + mean.prec4 + mean.prec5 +
                              mean.prec6 + mean.prec7 + mean.prec8 + mean.prec9 + mean.prec10 + mean.prec11 +
                              mean.prec12)
Mapa<- crop(prec,precpa)
mapa<- mask(Mapa,precpa)
names(mapa) <- month.name
plot(mapa, col=hcl.colors(10, rev=T))
#----------------------------------------------------------------------------------------------------
#                  DADOS DE MERCADO
Anual<-c("2015","2016","2017","2018","2019","2020","2021","2022")
Ano<-as.numeric(Anual)
AreaColhida<-c(135691,166464,188483,171997,188015,212479,198963,224044)
RendimentoMedio<-c(7376,6492,6760,7155,7022,6542,6977,7121)
MercadoAcai<-data.frame(Anual,AreaColhida,Ano,RendimentoMedio)

ggplot(MercadoAcai) +
  aes(x = Anual, weight = AreaColhida) +
  geom_bar(fill = "lightgreen",color="black") +
  labs(x = "Ano", 
       y = "Área de colhida ( Unidade: ha ) ", title = "Colheita de açaí") +
  theme_bw() +
  theme(plot.title = element_text(size = 16L))

MercadoAcai%>%
  ggplot(aes(Ano,RendimentoMedio))+
  labs(title="Rendimento Médio 2015 - 2022",
       x="Ano",
       y="Rendimento (Kg/Ha)")+
  geom_line(size=0.7)+
  geom_point(color="black",fill="black",shape=21,size=3.5)+
  theme_economist()
