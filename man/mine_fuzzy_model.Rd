% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mine_fuzzy_model.R
\name{mine_fuzzy_model}
\alias{mine_fuzzy_model}
\title{Mines eventlog data using Fuzzy Algorithm}
\usage{
mine_fuzzy_model(eventlog)
}
\arguments{
\item{eventlog}{An eventlog object}
}
\value{
A list of metrics which contains significance of each activities
and their precedence relations with each other for several parameters
}
\description{
Takes eventlog as input, applies fuzzy mining algorithm and returns a list of metrics which specifies significance for different activities and their precedence relations.
}
\details{
\strong{\emph{mine_fuzzy_model}} uses \strong{fuzzy mining algorithm} to mine eventlog data
and generates a list of metrics. This list of metrics is then used for
creating process models. Fuzzy mining algorithm is widely used to create
process models because of its adaptiveness.

It generates a fixed number of metrics. There are total of 9 metrics generated
by this algorithm. Out of this, 2 metrics are for the activities which will be
nodes in our process models. Other 7 would represent precedence relation between
them and would form edges in the process model. These precedence relation are
of two types - significance and correlation. Out of 7, 2 would be significance
relations and 5 would be correlation metrics.

\strong{Frequency Unary Significance :} The more often an activity is observed
in event log more the value of frequency significance of that activity.

\strong{Routing Unary Significance :} The higher the number and significance
of predecessors for a node (Activity) differs from the number and significance
of its successors the more important that node is for routing in the process.

\strong{Frequency Binary Significance :} The more often two activities
are observed after one another, the more significant their
precedence relation

\strong{Distance Binary Significance :} This metric calculates the significance of
two activity that occur in a trace but not after one another. More the
distance, less is the weightage of that significance value. Hence it takes
into account the significance of all the global relations.

\strong{Proximity Binary Correlation :} This metric captures the activities
that occur shortly after one another and measures there correlation. This
metric is important for identifying the clusters of activites that occur in
short time frame and hence can be seen as one logical activity.

\strong{Originator Binary Correlation :} Correlation between two activities that is
determined by the name/ID of the person who have triggered the event. Similar
the names, the higher the correlation between two activities. Eg: Resource
person names : (sales_x, sales_y) and (technical_x, technical_y)

\strong{Endpoint Binary Correlation :} Correlation between two activities is
determined by the name of the two events. More similar the names are more is
the correlation between activites. Eg : (Check_x, Check_y)

\strong{Data Type Correlation :} Correlation bewteen two activities is higher
when sub-sequent activities share large amount of data types(attributes keys).


\strong{Data Value Correlation :} Corrrelation between two activities is determined
by the values of these shared data types or common attributes. More similar the
value higher is the correlation.

For getting more insights about these metrics and what is their importance, please
go to the reference website.
}
\examples{
\dontrun{
#' library(fuzzymineR)
data("artificial_loan_process")
log <- create_eventlog(artificial_loan_process,
                       case_id = "case",
                       activity_id = "event",
                       timestamp = "completeTime")
metrics <- mine_fuzzy_model(log)
}
}
\references{
\href{http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.81.1207&rep=rep1&type=pdf}{Fuzzy Mining - Adaptive Process Simplification
Based on Multi-Perspective Metrics}
}
\seealso{
\link[fuzzymineR]{create_eventlog}, \link[fuzzymineR]{viz_fuzzy_model}
}

