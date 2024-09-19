setwd("L:/BUT/SD/Promo 2023/abourasset/Année 1")

ancien = read.csv("dpe-v2-logements-existants.csv", header = TRUE, dec = ".",",")
neuf = read.csv("dpe-v2-logements-neufs.csv", header = TRUE, dec = ".",",")

dim(ancien)
dim(neuf)

ancien$Logement = "ancien"
neuf$Logement = "neuf"


col_communes = intersect(colnames(ancien),colnames(neuf))

df = rbind(ancien[,col_communes], neuf[,col_communes])

df$Annee_réception_DPE = substr(df$Date_réception_DPE, 1, 4)




df$Coût_verif <- df$Coût_total_5_usages == (df$Conso_chauffage + df$Coût_éclairage + df$Coût_refroidissement + df$Coût_auxiliaires)

