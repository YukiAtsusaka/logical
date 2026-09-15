#' Louisiana Mayoral Elections
#'
#' Municipality-election data used in the online appendix to evaluate the
#' logical model for Black candidate emergence and electoral success in
#' Louisiana. The packaged object preserves the deposited rows, column names,
#' values, and storage types.
#'
#' @format A data frame with 2,037 rows and 21 variables:
#' \describe{
#'   \item{NOLA}{Indicator for New Orleans.}
#'   \item{year}{Election year.}
#'   \item{run}{Indicator that at least one Black candidate ran.}
#'   \item{win}{Indicator that a Black candidate won.}
#'   \item{M_raw}{Raw racial margin of victory: the top Black candidate's vote
#'     share minus the top non-Black candidate's vote share, in percentage
#'     points.}
#'   \item{M}{Adjusted racial margin of victory, equal to
#'     \code{M_raw + 50}.}
#'   \item{C}{Black share of the municipal population, in percent.}
#'   \item{incumb_ran}{Indicator that the incumbent ran.}
#'   \item{unopposed}{Indicator for an unopposed election.}
#'   \item{city_type}{Municipality type: rural, suburban, or urban.}
#'   \item{city_council}{City-council electoral system: at large,
#'     single-member district, or mixed.}
#'   \item{woman_run}{Indicator that at least one woman ran.}
#'   \item{woman_win}{Indicator that a woman won.}
#'   \item{num_black_cand}{Number of Black candidates.}
#'   \item{M_t2}{Adjusted racial margin of victory two elections earlier.}
#'   \item{M_t3}{Adjusted racial margin of victory three elections earlier.}
#'   \item{educ_baplus_black}{Percentage of Black residents with a bachelor's
#'     degree or higher.}
#'   \item{educ_baplus_white}{Percentage of White residents with a bachelor's
#'     degree or higher.}
#'   \item{new_electiontime}{Indicator for an on-cycle election.}
#'   \item{white_over65}{Deposited measure for White residents aged 65 or older.
#'     The source README labels this field as a percentage, although deposited
#'     values are not bounded by 100.}
#'   \item{density}{Municipal population-density measure.}
#' }
#'
#' The source README describes the data as a transformed and reduced version of
#' Louisiana mayoral-election data collected through the Local Elections in
#' America Project. The appendix file does not include municipality names.
#'
#' @source Atsusaka, Y. (2021). Replication Data for: A Logical Model for
#'   Predicting Minority Representation: Application to Redistricting and Voting
#'   Rights Cases. Harvard Dataverse, version 1.0, CC0 1.0.
#'   \doi{10.7910/DVN/F2OX6O}
#' @references Atsusaka, Y. (2021). A Logical Model for Predicting Minority
#'   Representation: Application to Redistricting and Voting Rights Cases.
#'   \emph{American Political Science Review}, 115(4), 1210-1225.
#'   \doi{10.1017/S000305542100054X}
#' @docType data
#' @keywords datasets
#' @name louisiana
#' @usage data(louisiana)
"louisiana"

#' State Legislative General Elections
#'
#' Group-district-election data used to evaluate the logical model for Black,
#' Hispanic, and Asian candidate emergence and electoral success in 36 states
#' during the 2012 and 2014 general elections. The packaged object preserves the
#' deposited rows, column names, values, and storage types.
#'
#' @format A data frame with 1,306 rows and 20 variables:
#' \describe{
#'   \item{M}{Adjusted racial margin of victory, from 0 to 100.}
#'   \item{C}{Minority-group share of the citizen voting-age population, in
#'     percent.}
#'   \item{minority_run}{Indicator that at least one candidate from \code{group}
#'     ran.}
#'   \item{minority_win}{Indicator that a candidate from \code{group} won.}
#'   \item{white_run}{Deposited indicator for White candidate emergence.}
#'   \item{state}{Uppercase state abbreviation.}
#'   \item{state.lower}{Lowercase state abbreviation.}
#'   \item{year}{Election year.}
#'   \item{phase}{Source-specific integer coding field, from 1 to 7. The
#'     Dataverse README does not define this field.}
#'   \item{sl_chamber}{Legislative chamber code: 8 for state senate and 9 for
#'     state house.}
#'   \item{sl_district}{Single-member legislative district number.}
#'   \item{group}{Minority group: Asian, Black, or Hispanic.}
#'   \item{white_pct}{White share of the citizen voting-age population, in
#'     percent.}
#'   \item{unusual}{Indicator for districts with unusual coding or redistricting
#'     histories.}
#'   \item{south}{Indicator for a Southern state.}
#'   \item{deepsouth}{Indicator for a Deep South state.}
#'   \item{rimsouth}{Indicator for a Rim South state.}
#'   \item{section5}{Indicator for coverage under Sections 4 and 5 of the Voting
#'     Rights Act at the time of \emph{Shelby County v. Holder} (2013).}
#'   \item{litigated}{Indicator that the district was identified in litigation
#'     during the 2010 redistricting cycle.}
#'   \item{proper}{Additional deposited indicator. All observations equal 1 in
#'     version 1.0, and the Dataverse README does not define this field.}
#' }
#'
#' The source README describes this as a transformed and augmented version of
#' the state legislative election data compiled by Fraga, Juenke, and Shah.
#'
#' @source Atsusaka, Y. (2021). Replication Data for: A Logical Model for
#'   Predicting Minority Representation: Application to Redistricting and Voting
#'   Rights Cases. Harvard Dataverse, version 1.0, CC0 1.0.
#'   \doi{10.7910/DVN/F2OX6O}
#' @references Atsusaka, Y. (2021). A Logical Model for Predicting Minority
#'   Representation: Application to Redistricting and Voting Rights Cases.
#'   \emph{American Political Science Review}, 115(4), 1210-1225.
#'   \doi{10.1017/S000305542100054X}
#' @docType data
#' @keywords datasets
#' @name state_legislative
#' @usage data(state_legislative)
"state_legislative"
