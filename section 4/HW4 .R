#Free Throw Attempts matrix
FTA <- rbind(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,
             DwightHoward_FTA,ChrisBosh_FTA,ChrisPaul_FTA,KevinDurant_FTA,
             DerrickRose_FTA,DwayneWade_FTA)
colnames(FTA) <- c("2005", "2006", "2007", "2008", "2009", "2010", "2011",
                   "2012", "2013", "2014")

#Free Throw Attempts per game
FTA.per.game = FTA/10
matplot(t(FTA.per.game),type="b",pch=15:18,col=c(1:4,6))
#legend("bottomleft",inset=0.01,legend=Players,col=c(1:4,6),pch=15:18,horiz=F)


#Accuracy of free throw
FT <- rbind(KobeBryant_FT,JoeJohnson_FT,LeBronJames_FT,CarmeloAnthony_FT,
             DwightHoward_FT,ChrisBosh_FT,ChrisPaul_FT,KevinDurant_FT,
             DerrickRose_FT,DwayneWade_FT)
colnames(FT) <- Seasons
matplot((FTA-FT)/10,type="b",pch=15:18,col=c(1:4,6))




#corrected 
FT <- rbind(KobeBryant_FT,JoeJohnson_FT,LeBronJames_FT,CarmeloAnthony_FT,
            DwightHoward_FT,ChrisBosh_FT,ChrisPaul_FT,KevinDurant_FT,
            DerrickRose_FT,DwayneWade_FT)
colnames(FT) <- Seasons
rownames(FT) <- Players

FTA <- rbind(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,
             DwightHoward_FTA,ChrisBosh_FTA,ChrisPaul_FTA,KevinDurant_FTA,
             DerrickRose_FTA,DwayneWade_FTA)
colnames(FTA) <- Seasons
rownames(FTA) <- Players

myplot <- function(data, who=1:10){ 
  # Data <- data[rows,,drop=F]
  matplot(t(data[who,,drop=F]),type="b",pch=15:18,col=c(1:4,6), main="hello")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}

#Free Throw Attempts per game
FTA.per.game = FTA/Games
matplot(t(FTA.per.game),type="b",pch=15:18,col=c(1:4,6))

#Free Throw accuracy 
matplot(t(FT/FTA),type="b",pch=15:18,col=c(1:4,6))

#Player Style
matplot((Points-FT)/FieldGoals,type="b",pch=15:18,col=c(1:4,6))
