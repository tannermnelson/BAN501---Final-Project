set I:= {"KC","SA", "AU","BI","FR","MU","SI"};
set J:= {"T","S","MC","M","L","C","A"};


set Links= {I,J};
var y{I} binary;
var x{Links} >=0;

param fixed{I};
param cap{I};
param demand{J};
param extCap{I};
param C{Links};
param expan{I};

minimize z: sum{i in I} y[i]*fixed[i] + sum{(i,j) in Links} C[i,j]*x[i,j] + sum{i in I} y[i]*expan[i];

s.t. capacity {i in I}: sum{(i,j) in Links} x[i,j] <= cap[i]*y[i] +y[i]*extCap[i];

s.t. demand_con {j in J}: sum{(i,j) in Links} x[i,j] = demand[j];

s.t. org: y["SA"] + y["KC"] = 2; # forces Santaigo and Kansas City plants to be used