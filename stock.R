library(quantmod)

loadStock <- function(symbol)
{
    data <- getSymbols(symbol, auto.assign = F, src = "yahoo")
    names(data) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
    
    return(data)
}

plotStock <- function(data, startDate = NA, endDate = NA)
{
    d <- data
    if(!is.na(startDate)) d <- d[index(d) >= startDate]
    if(!is.na(endDate)) d <- d[index(d) <= endDate]
    
    plot(
        x = index(d),
        y = d$Adjusted,
        xlab = "Date",
        ylab = "Price"
    )
}
