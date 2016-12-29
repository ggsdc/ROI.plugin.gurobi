# Gurobi plug in for R package: ROI

[ROI](https://github.com/cran/ROI) is an R package that creates one interface for multiple optimization solvers. It provides great convenience to R users who want to switch different solvers easily for their optimization problems. To add a new solver to the ROI framework, one needs to create a plugin for the new solver. Currently, the available solver plugins on github are: *glpk*, *symphony* and *quadprog*.


This plugin is written for one of the leading commercial optimization solver [Gurobi](http://gurobi.com/)'s R API. Since I am using  **Gurobi 6.5.0**, to be compatible, your R version needs to be **>= R 3.2.1**. 


This plugin hasn't been tested extensively and is not submitted to CRAN yet, thus I recommend that you install it by
 - `devtools::install_github('ggsdc/ROI.plugin.gurobi')`

The plugin will be included automatically when you include the package *ROI*, so you only need to 
```
library(ROI)
```
in order to use it. You can verify if *ROI.plugin.gurobi* is registered to *ROI* by typing the following in R console. 
```
ROI_registered_solvers()
```


This repository is a forked from: [original repository](https://github.com/kuol/ROI.plugin.gurobi).

It has been modified in order to work with the latest ROI version and it is being updated to include more parameter options from gurobi in the connection.