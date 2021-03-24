Price = 43.75;
Strike = 43.75;
Rate = 0;
Time = 0.5;
Volatility = (0.04729+0.005)*sqrt(252);
[CallDelta,PutDelta] = blsdelta(Price,Strike,Rate,Time,Volatility)