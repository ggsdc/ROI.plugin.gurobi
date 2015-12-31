# ====================
# ROI plugin: Gurobi
# Author: Kuo LIu
# Date  : 12/16/2015
# ====================

gurobi_status_code <- list(
  LOADED = 1L,
  OPTIMAL = 2L,
  INFEASIBLE = 3L,
  INF_OR_UNBD = 4L,
  UNBOUNDED = 5L,
  CUTOFF = 6L,
  ITERATION_LIMIT = 7L,
  NODE_LIMIT = 8L,
  TIME_LIMIT = 9L,
  SOLUTION_LIMIT = 10L,
  INTERRUPTED = 11L,
  NUMERIC = 12L,
  SUBOPTIMAL = 13L,
  INPROGRESS = 14L
  )

solve_OP <- function(x, control) {
  solver <- ROI:::get_solver_name( getPackageName() )

  model <- list()
  model$A <- constraints(x)$L
  model$obj <- as.vector(terms(objective(x))[["L"]])
  model$modelsense <- if(x$maximum) "max" else "min"
  model$rhs <- constraints(x)$rhs
  model$sense <- constraints(x)$dir
  model$vtype <- types(x)

  out <- gurobi(model, control)

  ROI:::canonicalize_solution( solution = out$x,
                             optimum = out$objval,
                             status = gurobi_status_code[[out$status]],
                             solver = solver )
}


.add_status_codes <- function() {
  solver <- ROI:::get_solver_name( getPackageName() )
  ROI:::add_status_code_to_db(solver,
                              1L,
                              "LOADED",
                              "Model is loaded, but no solution information is available."
                            )
  ROI:::add_status_code_to_db(solver,
                              2L,
                              "OPTIMAL",
                              "Model was solved to optimality (subject to tolerances), and an optimal solution is available.",
                              0L # this is for roi_code. 0 means we have got the solution. 1L is the default value.
                              )
  ROI:::add_status_code_to_db(solver,
                              3L,
                              "INFEASIBLE",
                              "Model was proven to be infeasible."
                              )
  ROI:::add_status_code_to_db(solver,
                              4L,
                              "INF_OR_UNBD",
                              "Model was proven to be either infeasible or unbounded."
                              )
  ROI:::add_status_code_to_db(solver,
                              5L,
                              "UNBOUNDED",
                              "Model was proven to be unbounded."
                              )
  ROI:::add_status_code_to_db(solver,
                              6L,
                              "CUTOFF",
                              "Optimal objective for model was proven to be worse than the value specified in the Cutoff parameter. No solution information is available."
                              )
  ROI:::add_status_code_to_db(solver,
                              7L,
                              "ITERATION_LIMIT",
                              "Optimization terminated because the total number of simplex iterations performed exceeded the value specified in the IterationLimit parameter, or because the total number of barrier iterations exceeded the value specified in the BarIterLimit parameter."
                              )
  ROI:::add_status_code_to_db(solver,
                              8L,
                              "NODE_LIMIT",
                              "Optimization terminated because the total number of branch-andcut nodes explored exceeded the value specified in the NodeLimitparameter."
                              )
  ROI:::add_status_code_to_db(solver,
                              9L,
                              "TIME_LIMIT",
                              "Optimization terminated because the time expended exceeded the value specified in the TimeLimit parameter."
                              )
  ROI:::add_status_code_to_db(solver,
                              10L,
                              "SOLUTION_LIMIT",
                              "Optimization terminated because the number of solutions found reached the value specified in the SolutionLimit parameter."
                              )
  ROI:::add_status_code_to_db(solver,
                              11L,
                              "INTERRUPTED",
                              "Optimization was terminated by the user."
                              )
  ROI:::add_status_code_to_db(solver,
                              12L,
                              "NUMERIC",
                              "Optimization was terminated due to unrecoverable numerical difficulties."
                              )
  ROI:::add_status_code_to_db(solver,
                              13L,
                              "SUBOPTIMAL",
                              "Unable to satisfy optimality tolerances; a sub-optimal solution is available."
                              )
  ROI:::add_status_code_to_db(solver,
                              14L,
                              "INPROGRESS",
                              "An asynchronous optimization call was made, but the associated optimization run is not yet complete."
                              )

  invisible(TRUE)
}
