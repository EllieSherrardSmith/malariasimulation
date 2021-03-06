test_that('total_M and EIR functions are consistent with equilibrium EIR', {
  EIR <- 5
  jamie_parameters <- malariaEquilibrium::load_parameter_set()
  h_eq <- malariaEquilibrium::human_equilibrium_no_het(
    EIR,
    0,
    jamie_parameters,
    0:99
  )
  foim <- sum(h_eq[,'inf']*h_eq[,'psi'])
  population <- 1000
  parameters <- get_parameters(c(
    translate_jamie(remove_unused_jamie(jamie_parameters)),
    list(
      init_foim = foim,
      variety_proportions = 1,
      human_population = population
    )
  ))
  parameters <- parameterise_mosquito_equilibrium(parameters, EIR)
  m_eq <- initial_mosquito_counts(parameters, foim)

  age <- rep(seq(100) - 1, rowSums(h_eq[,c('S', 'U', 'A', 'D')]) * population)
  xi <- rep(1, length(age))
  infectivity <- m_eq[[6]] * parameters$blood_meal_rate
  expect_equal(
    sum(eir(age, xi, infectivity, parameters)),
    EIR
  )
})

test_that('total_M and EIR functions are consistent with equilibrium EIR (with het)', {
  population <- 1000

  EIR <- 5
  n_groups <- 10

  jamie_parameters <- malariaEquilibrium::load_parameter_set()
  het_groups <- statmod::gauss.quad.prob(n_groups, dist = "normal")
  h_eqs <- list()
  foim <- 0
  all_age <- c()
  all_xi <- c()

  for (h in seq(n_groups)) {
    h_eq <- malariaEquilibrium::human_equilibrium_no_het(
      EIR,
      0,
      jamie_parameters,
      0:99
    )
    xi <- exp(
      -jamie_parameters$s2 * .5 + sqrt(
        jamie_parameters$s2
      ) * het_groups$nodes[h]
    )
    age <- rep(
      seq(100) - 1,
      rowSums(h_eq[,c('S', 'U', 'A', 'D')]) * het_groups$weights[h] * population
    )
    all_age <- c(all_age, age)
    all_xi <- c(all_xi, rep(xi, length(age)))
    foim <- foim + sum(h_eq[,'inf'] * h_eq[,'psi']) * het_groups$weights[h] * xi
  }

  parameters <- get_parameters(c(
    translate_jamie(remove_unused_jamie(jamie_parameters)),
    list(
      init_foim = foim,
      variety_proportions = 1,
      human_population = population
    )
  ))
  parameters <- parameterise_mosquito_equilibrium(parameters, EIR)
  m_eq <- initial_mosquito_counts(parameters, foim)
  infectivity <- m_eq[[6]] * parameters$blood_meal_rate

  expect_equal(
    sum(eir(all_age, all_xi, infectivity, parameters)),
    EIR
  )
})
