plot1<-function(date1="",date2="",file_name=""){
  
  ##reads the data
  data<-read.table(file_name,sep=";",na.string="?",header=TRUE)
  ##the fomat of the parameter data is YYYY-MM-DD
  ##subset the data for the 2 given dates
  sub_data<-subset(data,as.Date(data$Date,format="%d/%m/%Y")==date1| as.Date(data$Date,format="%d/%m/%Y")==date2)
  
  ##reate the histogram
  hist(sub_data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="Red")
  
  ##copy the istogram from the screen device into a png with given height and width
  dev.copy(png,"plot1.png",height=480,width=480)
  ##turn off the png device
  dev.off()
}