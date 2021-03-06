% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameters.R
\name{get_parameters}
\alias{get_parameters}
\title{Get model parameters}
\usage{
get_parameters(overrides = list())
}
\arguments{
\item{overrides}{a named list of parameter values to use instead of defaults
The parameters are defined below.

fixed state transitions:
\itemize{
\item dd - the delay for humans to move from state D to A
\item dt - the delay for humans to move from state Tr to Ph
\item da - the delay for humans to move from state A to U
\item du - the delay for humans to move from state U to S
\item del - the delay for mosquitos to move from state E to L
\item dl - the delay for mosquitos to move from state L to P
\item dpl - the delay mosquitos to move from state P to Sm
\item mup - the rate at which pupal mosquitos die
\item mum - the rate at which developed mosquitos die
}

immunity decay rates:
\itemize{
\item rm - decay rate for maternal immunity to clinical disease
\item rvm - decay rate for maternal immunity to severe disease
\item rb - decay rate for acquired pre-erytrhrocytic immunity
\item rc - decay rate for acquired immunity to clinical disease
\item rva - decay rate for acquired immunity to severe disease
\item rid - decay rate for acquired immunity to detectability
}

probability of pre-erythrocytic infection:
\itemize{
\item b0 - maximum probability due to no immunity
\item b1 - maximum reduction due to immunity
\item ib0 - scale parameter
\item kb - shape parameter
}

probability of clinical infection:
\itemize{
\item phi0 - maximum probability due to no immunity
\item phi1 - maximum reduction due to immunity
\item ic0 - scale parameter
\item kc - shape parameter
}

probability of severe infection:
\itemize{
\item severe_enabled - whether to model severe disease
\item theta0 - maximum probability due to no immunity
\item theta1 - maximum reduction due to immunity
\item iv0 - scale parameter
\item kv - shape parameter
\item fv0 - age dependent modifier
\item fvt - reduced probability of death due to treatment
\item av - age dependent modifier
\item gammav - age dependent modifier
}

immunity reducing probability of detection:
\itemize{
\item fd0 - time-scale at which immunity changes with age
\item ad - scale parameter relating age to immunity
\item gammad - shape parameter relating age to immunity
\item d1 - minimum probability due to immunity
\item dmin - minimum probability due to immunity NOTE: there appears to be a
mistake here!
\item id0 - scale parameter
\item kd - shape parameter
}

immunity boost grace periods:
\itemize{
\item ub - period in which pre-erythrocytic immunity cannot be boosted
\item uc - period in which clinical immunity cannot be boosted
\item uv - period in which severe immunity cannot be boosted
\item ud - period in which immunity to detectability cannot be boosted
}

infectivity towards mosquitos:
\itemize{
\item cd - infectivity of clinically diseased humans towards mosquitos
\item gamma1 - parameter for infectivity of asymptomatic humans
\item cu - infectivity of sub-patent infection
\item ct - infectivity of treated infection
}

unique biting rate:
\itemize{
\item a0 - age dependent biting parameter
\item rho - age dependent biting parameter
\item sigma_squared - heterogeneity parameter
\item n_heterogeneity_groups - number discretised groups for heterogeneity, used
for sampling mothers
}

mortality parameters:
\itemize{
\item mortality_rate - human mortality rate across age groups
\item v - mortality scaling factor from severe disease
\item pcm - new-born clinical immunity relative to mother's
\item pvm - new-born severe immunity relative to mother's
\item me - early stage larval mortality rate
\item ml - late stage larval mortality rate
}

carrying capacity parameters:
\itemize{
\item model_seasonality - boolean switch TRUE iff the simulation models seasonal rainfall
\item g0 - rainfall fourier parameter
\item g - rainfall fourier parameter
\item h - rainfall fourier parameters
\item gamma - effect of density dependence on late instars relative to early
instars
}

initial state proportions:
\itemize{
\item s_proportion - the proportion of \code{human_population} that begin as Susceptable
\item d_proportion - the proportion of \code{human_population} that begin with
clinical disease
\item a_proportion - the proportion of \code{human_population} that begin as
Asymptomatic
\item u_proportion - the proportion of \code{human_population} that begin as
subpatents
\item t_proportion - the proportion of \code{human_population} that begin treated
}

initial immunity values:
\itemize{
\item init_icm - the immunity from clinical disease at birth
\item init_ivm - the immunity from severe disease at birth
\item init_ib  - the initial pre-erythrocitic immunity
\item init_ica - the initial acquired immunity from clinical disease
\item init_iva - the initial acquired immunity from severe disease
\item init_id  - the initial acquired immunity to detectability
}

incubation periods:
\itemize{
\item de - delay for infection
\item dem - delay for infection in mosquitoes
}

vector biology:
\itemize{
\item beta - the average number of eggs laid per female mosquito per day
\item total_M - the initial number of adult mosquitos in the simulation
\item init_foim - the FOIM used to calculate the equilibrium state for mosquitoes
\item variety_proportions - the relative proportions of each species
\item blood_meal_rates - the blood meal rates for each species
}

treatment parameters:
I recommend setting these with the convenience functions in
\code{drug_parameters.R}
\itemize{
\item drug_efficacy - a vector of efficacies for available drugs
\item drug_rel_c - a vector of relative onwards infectiousness values for drugs
\item drug_prophylaxis_shape - a vector of shape parameters for weibull curves to
model prophylaxis for each drug
\item drug_prophylaxis_scale - a vector of scale parameters for weibull curves to
model prophylaxis for each drug
\item ft - probability of seeking treatment if clinically diseased
\item clinical_treatment_drugs - a vector of drugs that are avaliable for
clinically diseased (these values refer to the index in drug_* parameters)
\item clinical_treatment_coverage - a vector of coverage values for each drug
}

RTS,S paramters:
\itemize{
\item rtss_vmax - the maximum efficacy of the vaccine
\item rtss_alpha - shape parameter for the vaccine efficacy model
\item rtss_beta - scale parameter for the vaccine efficacy model
\item rtss_cs - peak parameters for the antibody model (mean and std. dev)
\item rtss_cs_boost - peak parameters for the antibody model for booster rounds (mean and std. dev)
\item rtss_rho - delay parameters for the antibody model (mean and std. dev)
\item rtss_rho_boost - delay parameters for the antibody model for booster rounds (mean and std. dev)
\item rtss_ds - delay parameters for the antibody model (mean and std. dev)
\item rtss_dl - delay parameters for the antibody model (mean and std. dev)
}

I recommend setting strategies with the convenience functions in
\code{vaccine_parameters.R}
\itemize{
\item rtss - whether to model rtss or not
\item rtss_start - the start timstep for rtss
\item rtss_end - the end timstep for rtss
\item rtss_frequency - the frequency of rounds
\item rtss_ages - the ages to apply the vaccine (in years)
\item rtss_coverage - the fraction of the target population who will be covered
}

MDA parameters:
I recommend setting these with convenience functions in \code{mda_parameters.R}
\itemize{
\item mda - whether to apply an MDA or not
\item mda_drug - the index of the drug to use
\item mda_start - the first timestep for the drug to be distributed
\item mda_end - the last timestep for the drug to be distributed
\item mda_frequency - how often to distribute drugs
\item mda_min_age - the min age of the target population
\item mda_max_age - the max age of the target population
\item mda_coverage - the proportion of the target population that will be covered
\item smc* - as for mda*
}

miscellaneous:
\itemize{
\item human_population - the number of humans to model
\item mosquito_limit - the maximum number of mosquitos to allow for in the
simulation
\item days_per_timestep - the number of days to model per timestep
}}
}
\description{
get_paramaters creates a named list of parameters for use in the model. These
parameters are passed to process functions. These parameters are explained in
"The US President's Malaria Initiative, Plasmodium falciparum transmission
and mortality: A modelling study."
}
