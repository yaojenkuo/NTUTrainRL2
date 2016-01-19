# XML Parser - 7-11 Stores
# Source: 木刻思

# Libraries
packages <- c("httr", "XML", "stringr", "data.table", "DT")
sapply(packages, library, character.only=T)

# Get Stores
Get_Stores <- function(city, town){
  res <- POST("http://emap.pcsc.com.tw/EMapSDK.aspx", body = list(commandid="SearchStore", city = city, town = town))
  stores <- xmlParse(content(res, as = "text")) %>% 
    .["//GeoPosition"] %>% 
    xmlToDataFrame()
  return(stores)
}
#Sys.setlocale(category = "LC_ALL", locale="cht")
#storesDaan <- Get_Stores("台北市", "大安區")
#View(storesDaan)

# Get Towns
Get_Towns <- function(cityid) {
  res <- POST("http://emap.pcsc.com.tw/EMapSDK.aspx", body=list(commandid = "GetTown", cityid = cityid))
  towns <- xmlParse(content(res, as = "text")) %>% 
    .["//GeoPosition"] %>% 
    xmlToDataFrame()
  return(towns)
}
#towns01 <- Get_Towns('01')
#View(towns01)

#Get Cities
res<-GET("http://emap.pcsc.com.tw/lib/areacode.js")
res_text<-content(res,"text",encoding = "utf8")
cityreg <- "new AreaNode\\(\\'(.*)\\'.*new bu.* \\'(.*)\\'"
cities <- res_text %>% 
  str_match_all(cityreg)%>% 
  .[[1]] %>% 
  .[, c(2, 3)] %>% 
  data.frame()
colnames(cities)[1:2] <- c("cityname","citycode")
cities

#Get All Stores in Taipei City
stores <- list()
for (i in 2:2) {
  cityname <- cities$cityname[i]
  citycode <- cities$citycode[i]
  towns <- Get_Towns(citycode)
  for (townname in towns$TownName) {
    stores[[paste0(cityname, townname)]] <- Get_Stores(cityname, townname)
    citytown <- paste0(cityname, townname)
    message(citytown)
    if (nrow(stores[[citytown]]) > 0 ) {
      stores[[citytown]]$cityname <- cityname
      stores[[citytown]]$townname <- townname   
    }
    Sys.sleep(abs(rnorm(1, 0)))
  }
}
storesInTP <- rbindlist(stores)
storesInTP <- data.frame(storesInTP)

# Create new columns of lat, lng, and popups
storesInTPMap <- storesInTP[, c("X", "Y", "POIName", "Telno", "Address")]
storesInTPMap <- transform(
  storesInTPMap,
  lng = as.numeric(as.character(X))/1000000,
  lat = as.numeric(as.character(Y))/1000000,
  popups = sprintf("<p>%s</p><p>%s</p><p>%s</p>", POIName, Telno, Address)
)
stores711inTP <- storesInTPMap[, -c(1:5)]

# Write.csv
#big5File <- file('C:/NTUTrainRL2/data/stores711inTP.csv', encoding="big5")
#write.csv(stores711inTP, file=big5File, row.names=F)

# saveRDS
saveRDS(stores711inTP, "C:/NTUTrainRL2/data/stores711inTP.rds")
