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
