path <- paste0(path.package("fuzzymineR"),.Platform$file.sep,"data",.Platform$file.sep,"artificial_loan_process")
log <- create_eventlog(path,
                       case_id = "case",
                       activity_id = "event",
                       timestamp = "completeTime")
metrics <- mine_fuzzy_model(log)
print(metrics)
