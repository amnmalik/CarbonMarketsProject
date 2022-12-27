
make_csv <- function(sp_name,sb_name,tech,year= c(1975,1990,seq(2005,2100,5))){
  df <- data.frame(sc_name=rep(sp_name,each=length(year)),
                    sb_name= rep(sb_name,each=length(year)),
                   tech = rep(tech,each=length(year)),
                    year_1 = year
                    )
  colnames(df) <- c("sector-name","subsector-name","technology","year")

  readr::write_csv(df,file = paste0(unique(sp_name)[1],".csv"),quote = "none")
}

#
iron_steel <- make_csv(sp_name = "iron and steel",
                       sb_name = c("BLASTFUR","BLASTFUR","BLASTFUR","BLASTFUR",
                                   "EAF with DRI","EAF with DRI","EAF with DRI",
                                   "EAF with DRI",
                                   "BLASTFUR"),
                      tech = c("BLASTFUR","BLASTFUR with CCS","Biomass-based",
                               "BLASTFUR with hydrogen","EAF with DRI",
                               "EAF with DRI CCS","Hydrogen-based DRI",
                               "EAF with scrap","BLASTFUR CCS with hydrogen"))
cement <- make_csv(sp_name = c("cement","cement",rep(c("process heat cement"),each=5)),
                   sb_name = c("cement","cement","biomass","coal","gas",
                               "refined liquids","hydrogen"),
                   tech = c("cement","cement CCS","biomass","coal","gas",
                            "refined liquids","hydrogen")
                    )
almn <- make_csv(sp_name = c(rep("alumina",each = 13),"aluminum"),
                 sb_name = c(rep("refined liquids",each=3),
                             rep("coal",each=3),
                             rep("gas",each=3),
                             rep("biomass",each=3),"heat","electricity"),
                 tech = c("refined liquids","refined liquids cogen","refined liquids CCS",
                         "coal","coal cogen","coal CCS","gas","gas cogen","gas CCS",
                         "biomass","biomass cogen","biomass CCS","heat","electricity"))
fertilizer <- make_csv(sp_name = c(rep("N fertilizer",6)),
                      sb_name = c("coal","coal","gas","gas","hydrogen","refined liquids"),
                      tech = c("coal CCS","coal","gas","gas CCS","hydrogen","refined liquids"))
tpp <- make_csv(sp_name = rep("electricity",each = 10),
                sb_name = c(rep("coal",4),rep("gas",3),rep("refined liquids",3)),
                tech = c("coal (conv pul)","coal (conv pul CCS)","coal (IGCC)",
                         "coal (IGCC CCS)","coal (IGCC CCS)","gas (CC)",
                         "gas (CC CCS)",'refined liquids (steam/CT)',"refined liquids (CC)",
                         "refined liquids (CC CCS)"))

railways <- make_csv(sp_name = c(rep("trn_freight",3),rep("trn_pass",2)),
                     sb_name = c(rep("Freight Rail",3), rep("Passenger Rail",2)),
                     tech = c("Coal","Electric","Liquids","Electric","Liquids"))

comm_bldgs <- make_csv(sp_name = c(rep("comm heating",7),rep("comm others",7),rep("comm cooling",2)),
                         sb_name = c(rep(c("biomass","coal","electricity","gas",
                                   "refined liquids","district heat","gas"),2),
                                   "electricity","gas"),
                       tech = c(rep(c("biomass","coal","electricity","gas",
                                      "refined liquids","district heat","hydrogen"),2),
                                "electricity","gas"))



