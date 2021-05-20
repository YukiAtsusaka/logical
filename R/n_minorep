#' @title minorep
#'
#' @description  \code{n_minorep} computes a vector of the number of minority candidates who run for office and win in given districts
#'
#' @param model_pred A vector of model predictions obtained from \code{minorep}
#'
#' @return A vector of the predicted number of minority candidates who run for office and win in given districts
#' @examples
#' M_vec = c(20, 50, 30)
#' C_vec = c(40, 70, 85)
#' p_vec <- minorep(M=M_vec, C=C_vec, gap=c(0.5, 0.6)) # Assuming that minority turnout is 0.5 and White turnout is 0.6 
#' n_minorep(model_pred=p_vec)
#' @export

n_minorep <- function(model_pred){

# Perform Monte Carlo Simulations
N_pred <- NA

for(i in 1:1000){
model.sample = sapply(model_pred, function(x) rbinom(n=1, size=1, prob=x)) # Draw a sample from a Bernoulli distribution with each of the model predictions
N_pred[i] <- sum(model.sample)  # Aggregate the number of successes: minority candidates and officeholders                    
}

return(N_pred)
}
