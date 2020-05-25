# Bayesian Seasonal Global Trend (BSGT) Model

### Introduction
This is a demonstration script. It shows how to estimate a time series forecasting model and generate forecasts in Python (NumPyro). More specifically, we will replicate the Seasonal Global Trend (SGT) model from the Rlgt package in R. The time series data that we will use for this demonstration is the popular Airline Passenger dataset, which shows the nonlinear trend and heteroscedastic seasonality. 

### Model
The models can be seen as extensions of following Exponential Smoothing models: Holt-Winters model. The main differences are as follows:
- the nonlinear global trend, that spans damped, linear, to exponential trends.
- Student-t distribution of error
- function for the error size, so the model is heteroscedastic
- possibility to add regression components.

The nonlinear global trend allows to model well a frequent situation in business where series grow faster than linearly, but slower than exponentially. The global trend can also fit a damped trend.

### Model Estimation and Forecasting
A more detailed explanation for SGT model can be found in this vignette from the authors of the Rlgt package. The model estimation and forecasting are based on the Bayesian regression framework in NumPyro. The Airline Passenger dataset is used to test the full potential of the BSGT model. 

### Conclusion
The BSGT model is working properly even without a log or Box-Cox transformation. It successfully captures the heteroscedastic seasonality and the nonlinear trend. 

### Model Limitations
There are two main limitations of the BSGT model:
1. The model only takes and forecasts non-negative values. This means some transformations should be performed before applying this model for each time series, which significantly limits the application of this model. 
2. The model only takes integer seasonality, which limits its application to some data frequency, say weekly data.
