# Rebuild the paper datasets distributed with logical.
#
# Run this script from the package root. It downloads the original CSV files
# behind the Dataverse tabular records, verifies their published checksums, and
# saves the unmodified data frames under their package-facing names.

download_dataverse_file <- function(file_id, filename, expected_md5) {
  source_url <- sprintf(
    "https://dataverse.harvard.edu/api/access/datafile/%s?format=original",
    file_id
  )
  destination <- file.path(tempdir(), filename)

  utils::download.file(source_url, destination, mode = "wb", quiet = FALSE)
  observed_md5 <- unname(tools::md5sum(destination))
  if (!identical(observed_md5, expected_md5)) {
    stop(
      sprintf(
        "Checksum mismatch for %s: expected %s, received %s.",
        filename,
        expected_md5,
        observed_md5
      ),
      call. = FALSE
    )
  }

  utils::read.csv(
    destination,
    check.names = FALSE,
    stringsAsFactors = FALSE,
    na.strings = "NA"
  )
}

louisiana <- download_dataverse_file(
  file_id = 4822067,
  filename = "Data_LAMayoral_Appendix.csv",
  expected_md5 = "86169ca509c4ec8f7713c046573ac575"
)

state_legislative <- download_dataverse_file(
  file_id = 4724745,
  filename = "Data_StateLegislative.csv",
  expected_md5 = "5fcebd0759097d6214caeb2d1f4b4d7c"
)

stopifnot(
  identical(dim(louisiana), c(2037L, 21L)),
  identical(
    names(louisiana),
    c(
      "NOLA", "year", "run", "win", "M_raw", "M", "C", "incumb_ran",
      "unopposed", "city_type", "city_council", "woman_run", "woman_win",
      "num_black_cand", "M_t2", "M_t3", "educ_baplus_black",
      "educ_baplus_white", "new_electiontime", "white_over65", "density"
    )
  ),
  identical(dim(state_legislative), c(1306L, 20L)),
  identical(
    names(state_legislative),
    c(
      "M", "C", "minority_run", "minority_win", "white_run", "state",
      "state.lower", "year", "phase", "sl_chamber", "sl_district", "group",
      "white_pct", "unusual", "south", "deepsouth", "rimsouth", "section5",
      "litigated", "proper"
    )
  )
)

dir.create("data", showWarnings = FALSE)
save(louisiana, file = "data/louisiana.rda", compress = "xz")
save(
  state_legislative,
  file = "data/state_legislative.rda",
  compress = "xz"
)
