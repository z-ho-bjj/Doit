#install.packages("stringi")
#install.packages("devtools")
#devtools::install_github("cardiomoon/kormaps2014")
library(DT)
library(kormaps2014)

str(changeCode(korpop1))

library(dplyr)
korpop1 <- rename(korpop1, pop = 총인구_명, name = 행정구역별_읍면동) 
korpop1$name <- iconv(korpop1$name, "UTF-8","CP949")

#install.packages("ggiraphExtra")
library(ggiraphExtra)
library(ggplot2)

str(changeCode(korpop1))

ggChoropleth(data = korpop1,      # 지도에 표현할 데이터
             aes(fill = pop,      # 색깔로 표현할 변수
                 map_id = code,   # 지역 기준 변수
                 tooltip = name), # 지도 위에 표시할 지역명
             map = kormap1,       # 지도 데이터
             interactive = T)     # 인터랙티브


str(changeCode(tbc))

tbc$name <- iconv(tbc$name, "UTF-8", "CP949")

ggChoropleth(data = tbc,          # 지도에 표현할 데이터
             aes(fill = NewPts,   # 색깔로 표현할 변수
                 map_id = code,   # 지역 기준 변수
                 tooltip = name), # 지도 위에 표시할 지역명
             map = kormap1,       # 지도 데이터
             interactive = T)     # 인터랙티브
