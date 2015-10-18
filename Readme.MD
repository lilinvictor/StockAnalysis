# Stock Analysis App using Shiny

This sample project is using Shiny R package to build an interactive web app fpr stock data exploring.

## Data source

The stock data set is queried with [quantmod](http://www.quantmod.com/) package.

## Usage

### Input

Go to left panel:

- Select the stock from the drop list;
- Choose the time window as start/end date of stock price.

### Output

Once the choice is changed, the stock price and chart will be then shown in right panel accordingly:

* In the tab "Stock price data":
    - Max and Min price during the time window are shown respectively;
    - Raw data for every day price in the time window
* In the tab "stock price chart":
    - Price trend chart is shown for the specified time window.

## Note

The stock data is queried from Yahoo web service using quantmod, so it's possible that no data is available for some specified time window.
