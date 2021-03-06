% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/individuals.R
\name{create_variables}
\alias{create_variables}
\title{Define model variables}
\usage{
create_variables(parameters)
}
\arguments{
\item{parameters, }{model parameters created by \code{get_parameters}}
}
\description{
create_variables creates the human and mosquito variables for
the model. Variables are used to track real data for each individual over
time, they are read and updated by processes

The human variables are defined as:
\itemize{
\item birth - an integer representing the timestep when this individual was born
\item last_boosted_* - the last timestep at which this individual's immunity was
boosted for tracking grace periods in the boost of immunity
\item is_severe - a binary indicator (0 or 1) for if the individual currently has
severe malaria
\item ICM - Maternal immunity to clinical disease
\item IVM - Maternal immunity to severe disease
\item IB  - Pre-erythoctic immunity
\item ICA  - Acquired immunity to clinical disease
\item IVA  - Acquired immunity to severe disease
\item ID - Acquired immunity to detectability
\item zeta - Heterogeneity of human individuals
\item zeta_group - Discretised heterogeneity of human individuals
\item rtss_vaccinated - The timstep of the last rtss vaccination (-1 if there
haven't been any)
\item rtss_boosted  - The timstep of the last rtss booster (-1 if there
haven't been any)
\item rtss_cs - peak antibodies
\item rtss_rho - antibody component variable
\item rtss_ds - short-lived antibody delay variable
\item rtss_dl - long-lived antibody delay variable
\item zeta_group - Discretised heterogeneity of human individuals
}

Mosquito variables are:
\itemize{
\item variety - The variety of mosquito, either 1, 2 or 3. These are related to
blood meal rate parameter
\item infectivity - The onward infectiousness to mosquitos
\item drug - The last prescribed drug
\item drug_time - The timestep of the last drug
}
}
