#* @apiTitle MGP API

#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  res$setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
  res$setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization")
  res$setHeader("Access-Control-Allow-Credentials", "true")
  plumber::forward()
}

#* @options /returnMyInput
#* @get /returnMyInput
#* @param inputValue:character 
#* @response 200 Return successfull
#* @response 500 Bad input
#* @response default Return successfull
function(inputValue) {
  
  # Extract the portfolio data
  theOutput = paste0("Your input was: ", inputValue)
  
  return(theOutput)
  
}

#* @options /sayHelloToWorld
#* @post /sayHelloToWorld
function(req) {
  
  theResponse = "Hello, world!"
  
  return(theResponse)
  
}

#* Run an MGP model
#* @param GO.term GO term to run
#* @param mutant Mutant for comparison
#* @param lambda Regularization strength
#* @post /mgp

function(req) {
  
  load("aws_test.Rdata")
  theResponse = ddsPLS::mddsPLS(Xs = probs.rows, Y = Y, R = 1, lambda = as.numeric(.05))$mod$u[[1]]
  
  return(theResponse)
  
}
