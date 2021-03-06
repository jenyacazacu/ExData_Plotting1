plot3<-function(date1="",date2="",file_name=""){
  
  ##reads the data
  data<-read.table(file_name,sep=";",na.string="?",header=TRUE)
  ##the fomat of the parameter data is YYYY-MM-DD
  ##subset the data for the 2 given dates
  sub_data<-subset(data,as.Date(data$Date,format="%d/%m/%Y")==date1| as.Date(data$Date,format="%d/%m/%Y")==date2)
  
  ##reate the plot of type line, paste the data an time together so that the x axis is split into 3 days
  plot(strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M"),sub_data$Sub_metering_1 , type="n",xlab="",ylab="Energy sub metering") 
  
  lines(strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M"),sub_data$Sub_metering_1,col="Black" )
  lines(strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M"),sub_data$Sub_metering_2,col="DarkOrange" )
  lines(strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M"),sub_data$Sub_metering_3,col="Blue" )
  
  ##add the legend
  legend("topright",cex=1,lty=c(1,1,1),lwd=c(2,2,2),col=c("Black","DarkOrange","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  ##copy the istogram from the screen device into a png with given height and width
  dev.copy(png,"plot3.png",height=480,width=480)
  ##turn off the png device
  dev.off()
}