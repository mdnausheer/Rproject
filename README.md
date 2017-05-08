# rproject
r functions
########################
First function:
#Input
a = read.csv("Attrition.csv”)

#Function
tab = function(x,y)
{
  x=x[ ,y]
#  s = vector("list",choose(ncol(x),2)) 
  t = vector("list",choose(ncol(x),2))
  b = 1
  for (i in 1:ncol(x))
  {
    
    j = i+1
    while (j <= ncol(x))
    {
      if(i < j)
        
#      s[[b]] = as.data.frame.matrix(table(x[,i],x[,j]))
      t[[b]] = as.data.frame.matrix(prop.table(table(x[,i],x[,j])))
#      names(s[[b]]) = paste(names(x)[i],"vs",names(x)[j])
      b = b+1
      j = j+1
    }}
#  return(s)
  return(t)}

#Test output
tab(a,c(3,5,8))
#############################
Second Function:
nstall.packages("mailR")
library(mailR)

 send.mail(from="praxisdev007@gmail.com",
          to="gourab@praxis.ac.in",
          subject="Email from R",
          body="Hi prof.Gourab, </br>
                This is a Test mail from R",
          html=T,
          smtp=list(host.name = "smtp.gmail.com",
                    port = 465,
                    user.name = "praxisdev007@gmail.com",
                    passwd = "politejetcar",
                    ssl = T),
          authenticate = T,
          attach.files = ("E:/Python_script/log_file.log”))
###########################

install.packages("fun")

library(fun)


shutdown <- function (wait = 0) 
{
  Sys.sleep(wait) #Suspend execution of R expressions for a specified time interval.
  ifelse(.Platform$OS.type == "windows", shell("shutdown -s -t 0"), 
         system("shutdown -h now"))
}

#Let's improvise.. say a user wants to give the time



shutdown <- function (wait) #event to wait for(in seconds)
{
  Sys.sleep(wait) #Suspend execution of R expressions for a specified time interval.
  time <- sprintf('shutdown -s -t %d',wait)
  ifelse(.Platform$OS.type == "windows", shell(time), 
         system("shutdown -h now"))
}
shutdown(5)

#System shell parameters
l : Logs off the current user, this is also the defualt. -m ComputerName takes precedence.
-s : Shuts down the local computer.
-r : Reboots after shutdown.
-a : Aborts shutdown. Ignores other parameters, except -l and ComputerName. You can only use -a during the time-out period.
-f : Forces running applications to close.
-m [\\ComputerName] : Specifies the computer that you want to shut down.
-t xx : Sets the timer for system shutdown in xx seconds. The default is 20 seconds.
-c "message" : Specifies a message to be displayed in the Message area of the System Shutdown window. You can use a maximum of 127 characters. You must enclose the message in quotation marks.
-d [u][p]:xx:yy : Lists the reason code for the shutdown. The following table lists the different values.
