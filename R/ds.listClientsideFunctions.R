#'
#' @title Lists client-side functions
#' @description Lists all current client-side functions
#' @details This function operates by directly interrogating
#' the R objects stored in the input client packages and objects of name
#' starting with \code{ds.} character in \code{.GlobalEnv}. 
#' 
#' This function does not call any server-side function. 
#' @return \code{ds.listClientsideFunctions} returns a list containing 
#' all  server-side functions. 
#' @author DataSHIELD Development Team
#' 
#' @examples 
#' \dontrun{
#'   ## Version 6, for version 5 see the Wiki
#'   
#'   #Library with all DataSHIELD functions
#'   require('dsBaseClient')
#'   
#'   #Visualise all functions
#'   ds.listClientsideFunctions()
#'   
#' }   
#' @export
ds.listClientsideFunctions  <-function(){

search.path<-search()

print.text.full<-NULL

test.dsBaseClient<-FALSE
test.dsBetaTestClient<-FALSE
test.userDefinedClient<-FALSE
test.no.functions<-TRUE
potential.clientside.repositories<-NULL

for(j in 1:length(search.path))
  {

  if(search.path[j]=="package:dsBaseClient")
    {
    test.dsBaseClient<-TRUE
	test.no.functions<-FALSE
    }

 if(search.path[j]=="package:dsBetaTestClient")
    {
    test.dsBetaTestClient<-TRUE
	test.no.functions<-FALSE
	}

  if(search.path[j]==".GlobalEnv")
    {
    test.userDefinedClient<-TRUE
	test.no.functions<-FALSE
	}
  }


		cat("\n### Full search path \n")
		print.search.list<-search()
		print(print.search.list)


	if(test.userDefinedClient==TRUE)
		{
		cat("\n### userDefinedClient functions \n")
		print.text<-ls(pos=".GlobalEnv",pattern="ds.*")
		if(identical(print.text,character(0)))print.text<-"No clientside functions in this repository"
		print(print.text)
		print.text.full<-c(print.text.full,print.text)
		}

	if(test.dsBetaTestClient==TRUE)
		{
		cat("\n### dsBetaTestClient functions \n")
		print.text<-ls(pos="package:dsBetaTestClient")
		if(identical(print.text,character(0)))print.text<-"No clientside functions in this repository"
		print(print.text)
		print.text.full<-c(print.text.full,print.text)
		}

	if(test.dsBaseClient==TRUE)
		{
		cat("\n### dsBaseClient functions \n")
		print.text<-ls(pos="package:dsBaseClient")
		if(identical(print.text,character(0)))print.text<-"No clientside functions in this repository"
		print(print.text)
		print.text.full<-c(print.text.full,print.text)
		}

	if(test.no.functions==TRUE)
		{
		cat("\n### No standard clientside functions identified \n")
		}

	cat("\nIf you cannot see one or more of the clientside functions you expected to find",
	    "please see above for the full search path. If one of the paths is a possible clientside repository",
	    "issue the R command ls(pos='package:dsPackageName')",
	    "where 'package:dsPackageName' is the full name stated in the search path\n\n")

	return(print.text.full)
}
# ds.listClientsideFunctions()
