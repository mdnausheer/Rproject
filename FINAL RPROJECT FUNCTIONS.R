setwd("C:/Users/singi/Desktop/results")
getwd()
data = read.csv("C:/Users/singi/OneDrive/Praxis/Praxis/DM/R/Attrition.csv")
data = mtcars

library(pushoverr)

set_pushover_user(user = "uzuduvge1xf79tgwn9fay6wf47gzqr")
set_pushover_app(token = "ax79h1oz1jr4ekmyr3cij1tbxsmpoh")
pushover_app.isset()
get_pushover_app()



install.packages("rtf")
library(rtf)
core <- function(data,y)
{
  tab <- function(data,y)
  {
    for(i in y)
    {
      if(!is.factor(data[,i]))
      {
        n <- readline(prompt="Enter B for box plot , H for histogram: ")
        
        if(n == "H")
        {
          
          png(paste(names(data)[i], ".png", sep="")) #NOTE this step
          
          hist(data[,i], main = paste("Histogram of", names(data)[i]), 
               xlab = names(data)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
          dev.off()  
        }
        
        else if(n=="B")
        {
          
          png(paste(names(data)[i], ".png", sep="")) #NOTE this step
          
          boxplot(data[,i], main = paste("Boxplot of", names(data)[i]), 
                  ylab = names(data)[i], col = "maroon", border = "grey5")
          dev.off() 
        }         
      }
      
      if(is.factor(data[,i]))
      {
        n <- readline(prompt="Enter BB for bar plot , P for PieChart: ")
        
        if(n == "BB")
        {
          
          png(paste(names(data)[i], ".png", sep="")) #NOTE this step
          
          barplot(table(data[,i]),
                  main = paste("Barplot of ",names(data)[i]),
                  xlab = names(data)[i],
                  ylab = "Frequency",
                  col = "light grey")
          
          dev.off()  
        }
        
        else if(n=="P")
        {
          
          png(paste(names(data)[i], ".png", sep="")) #NOTE this step
          
          pie(table(data[,i]),
              main = paste("Pie Chart of ",names(data)[i]),
              col = "light grey")
          
          dev.off()  
        }
      }
    }
    wd = getwd()
    library(rtf)
    library(png)
    final = RTF("out.doc")
    for(j in y)
    {
      addPng(final, file.path(wd, paste(names(data)[j], ".png",sep="")), width=6.5, height=5)
      done(final)
    }
  } 
  
tab(data,y)
find <- try(tab(data,y), silent= T)
noti <-  class(find) == "try-error" 

ifelse(noti == FALSE, pushover(message = "R script successfully completed",user ="uzuduvge1xf79tgwn9fay6wf47gzqr"),
       #Successful 
       #Unsuccessful
       pushover(message = "R script didn't run successfully",user ="uzuduvge1xf79tgwn9fay6wf47gzqr")
       )

}

core(data,c(1,2,3))

