# Gurobi plug in for R package: ROI

[ROI](https://github.com/cran/ROI) is an R package that creates one interface for multiple optimization solvers. It provides great convenience to R users who want to switch different solvers easily for their optimization problems. To add a new solver to the ROI framework, one needs to create a plugin for the new solver. Currently, the available solver plugins on github are: *glpk*, *symphony* and *quadprog*. 


This plugin is written for one of the leading commercial optimization solver [Gurobi](http://gurobi.com/)'s R API. Since I am using  **Gurobi 6.5.0**, to be compatible, your R version needs to be **>= R 3.2.1**. 


This plugin hasn't been tested extensively and is not submitted to CRAN yet, thus I recommend that you build and install the package locally by following the steps below. 


- Download the directory *ROI.plugin.gurobi*, delete *REAME.MD*
- Open your R console, change the work directory to where you put *ROI.plugin.gurobi*. e.g. if it is at `[Your Path]\ROI.plugin.gurobi`, then type `setwd([Your Path])` in R console.
- Build package: `system("R CMD build ROI.plugin.gurobi")`
- Install package: `system("R CMD INSTALL ROI.plugin.gurobi._0.0-1.tar.gz")`

The plugin will be included automatically when you include the package *ROI*, so you only need to 
```
library(ROI)
```
in order to use it. 
