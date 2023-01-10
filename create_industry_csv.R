
make_csv <- function(names,year= c(1975,1990,seq(2005,2100,5))){
  input <-  readr::read_delim(paste0("other_ext_data/",names,"_names.csv"),
                       delim = "\t", escape_double = FALSE,
                       col_names = FALSE, trim_ws = TRUE)

  df <- data.frame(sp_name=rep(input$X1,each=length(year)),
                    sb_name= rep(input$X2,each=length(year)),
                   tech = rep(input$X3,each=length(year)),
                    year_1 = year
                    )
  colnames(df) <- c("sector-name","subsector-name","technology","year")

 readr::write_csv(df,file = paste0("output/",names,".csv"),quote = "none")
 return(df)
}

my_techs <- c("ironsteel","cement","alumina","fertilizer","elec")

make_csv(names = my_techs[5])

#creating file with all names
write_csv(list.files(path = "output/",
           pattern="*.csv",
           full.names = T) %>%
  map_df(~read_csv(.)),quote = "none",file = "output/all_names.csv",)

# iron_steel <- make_csv(sp_name = "iron and steel",
#                        sb_name = c("BLASTFUR","BLASTFUR","BLASTFUR","BLASTFUR",
#                                    "EAF with DRI","EAF with DRI","EAF with DRI",
#                                    "EAF with DRI",
#                                    "BLASTFUR"),
#                       tech = c("BLASTFUR","BLASTFUR with CCS","Biomass-based",
#                                "BLASTFUR with hydrogen","EAF with DRI",
#                                "EAF with DRI CCS","Hydrogen-based DRI",
#                                "EAF with scrap","BLASTFUR CCS with hydrogen"))
# cement_names <- read_delim("other_ext_data/cement_names.csv",
#                                 delim = "\t", escape_double = FALSE,
#                                 col_names = FALSE, trim_ws = TRUE)
# cement <- make_csv(sp_name = cement_names$X1,sb_name = cement_names$X2,tech = cement_names$X3)
#
# write_csv(cement,file = "cement.csv",quote = "none")
#
# # cement <- make_csv(sp_name = c("cement","cement",rep(c("process heat cement"),each=5)),
# #                    sb_name = c("cement","cement","biomass","coal","gas",
# #                                "refined liquids","hydrogen"),
# #                    tech = c("cement","cement CCS","biomass","coal","gas",
# #                             "refined liquids","hydrogen"))
#
#
# # almn <- make_csv(sp_name = c(rep("alumina",each = 13),"aluminum"),
# #                  sb_name = c(rep("refined liquids",each=3),
# #                              rep("coal",each=3),
# #                              rep("gas",each=3),
# #                              rep("biomass",each=3),"heat","electricity"),
# #                  tech = c("refined liquids","refined liquids cogen","refined liquids CCS",
# #                          "coal","coal cogen","coal CCS","gas","gas cogen","gas CCS",
# #                          "biomass","biomass cogen","biomass CCS","heat","electricity"))
#
# alumina_names <- read_delim("other_ext_data/alumina_names.csv",
# delim = "\t", escape_double = FALSE,
# col_names = FALSE, trim_ws = TRUE)
#
# alumina <- make_csv(alumina_names$X1,sb_name = alumina_names$X2,tech = alumina_names$X3)
# write_csv(alumina,file = "alumina.csv",quote = "none")
#
#
# fertilizer <- make_csv(sp_name = c(rep("N fertilizer",6)),
#                       sb_name = c("coal","coal","gas","gas","hydrogen","refined liquids"),
#                       tech = c("coal CCS","coal","gas","gas CCS","hydrogen","refined liquids"))
#
# # tpp <- make_csv(sp_name = rep("elec_coal (conv pul)",each = 25,),
# #                 sb_name = c(rep("coal",4),rep("gas",3),rep("refined liquids",3),
# #                             rep("solar",4),rep("wind",3),rep("nuclear",2),
# #                             rep("biomass",4),"geothermal","rooftop_pv"),
# #                 tech = c("coal (conv pul)","coal (conv pul CCS)","coal (IGCC)",
# #                          "coal (IGCC CCS)","coal (IGCC CCS)","gas (CC)",
# #                          "gas (CC CCS)",'refined liquids (steam/CT)',"refined liquids (CC)",
# #                          "refined liquids (CC CCS)","CSP","CSP_storage",
# #                          "PV","PV_storage","wind","wind_offshore","wind_storage",
# #                          "Gen_III","Gen_II_LWR","biomass (IGCC CCS)","biomass (IGCC)",
# #                          "biomass (conv CCS)","biomass (conv)","geothermal","rooftop_pv"))
#
# elec_names <- read_delim("other_ext_data/elec_names.csv",
#                               delim = "\t", escape_double = FALSE,
#                               col_names = FALSE, trim_ws = TRUE)
# tpp <- make_csv(sp_name = elec_names$X1,sb_name = elec_names$X2,tech = elec_names$X3)
#
# write_csv(tpp,file = "electricity.csv",quote = "none")
#
#
# # tpp_new <- make_csv(sp_name = c(rep("elec_coal (IGCC)",4),
# #                                 rep("elec_coal (conv pul)",4),
# #                                 rep("elec_gas (CC)",4),
# #                                 rep("elec_gas (steam/CT)",4),
# #                                 rep("elec_refined liquids (CC)",4),
# #                                 rep("elec_refined liquids (steam/CT)",4)),
# #                 sb_name = c(rep("coal (IGCC)",4),
# #                             rep("coal (conv pul)",4),
# #                             rep("gas (CC)",4),
# #                             rep("gas (steam/CT)",4),
# #                             rep("refined liquids (CC)",4),
# #                             rep("refined liquids (steam/CT)",4)),
# #                 tech = c("coal (IGCC) (dry cooling)",
# #                          "coal (IGCC) (once through)",
# #                          "coal (IGCC) (recirculating)",
# #                          "coal (IGCC) (seawater)",
# #                          "coal (conv pul) (dry cooling)",
# #                          "coal (conv pul) (once through)",
# #                          "coal (conv pul) (recirculating)",
# #                          "coal (conv pul) (seawater)",
# #                          "gas (CC) (dry cooling)",
# #                          "gas (CC) (once through)",
# #                          "gas (CC) (recirculating)",
# #                          "gas (CC) (seawater)",
# #                          "gas (steam/CT) (dry cooling)",
# #                          "gas (steam/CT) (once through)",
# #                          "gas (steam/CT) (recirculating)",
# #                          "gas (steam/CT) (seawater)",
# #                          "refined liquids (CC) (dry cooling)",
# #                          "refined liquids (CC) (once through)",
# #                          "refined liquids (CC) (recirculating)",
# #                          "refined liquids (CC) (seawater)",
# #                          "refined liquids (steam/CT) (dry cooling)",
# #                          "refined liquids (steam/CT) (once through)",
# #                          "refined liquids (steam/CT) (recirculating)",
# #                          "refined liquids (steam/CT) (seawater)"))
#
#
# railways <- make_csv(sp_name = c(rep("trn_freight",3),rep("trn_pass",2)),
#                      sb_name = c(rep("Freight Rail",3), rep("Passenger Rail",2)),
#                      tech = c("Coal","Electric","Liquids","Electric","Liquids"))
#
# comm_bldgs <- make_csv(sp_name = c(rep("comm heating",7),rep("comm others",7),rep("comm cooling",2)),
#                          sb_name = c(rep(c("biomass","coal","electricity","gas",
#                                    "refined liquids","district heat","gas"),2),
#                                    "electricity","gas"),
#                        tech = c(rep(c("biomass","coal","electricity","gas",
#                                       "refined liquids","district heat","hydrogen"),2),
#                                 "electricity","gas"))
#
#
#
