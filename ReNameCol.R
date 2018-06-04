# This is to get all the function to rename a Col for data frame

colnames(newprice)<- c("premium","change","newprice")
colnames(X)[2] <- "superduper"
colnames(dataframe)[which(names(dataframe) == "columnName")] <- "newColumnName"


names(newprice)[1]<-paste("premium")
names(newprice)[1]<-"premium"
names(newprice) <- c("premium","change","newprice")

cols <- c("premium","change","newprice")
colnames(dataframe) <- cols
colnames(df)[which(colnames(df) %in% c("bad","worst") )] <- c("good","best")

rename.columns=function(df,changelist){
  #renames columns of a dataframe
  for(i in 1:length(names(df))){
    if(length(changelist[[names(df)[i]]])>0){
      names(df)[i]= changelist[[names(df)[i]]]
    }
  }
  df
}

