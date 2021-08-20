# Title     : TODO
# Objective : TODO
# Created by: rahmadakbar
# Created on: 7/9/21


# gets papers pertaining antibody database from europepmc

# import stuff
library(europepmc)

get_papers = function(){
    df = europepmc::epmc_search(query = '"antibody" and "database"', limit=10^6)
    print(df)
    current_date = Sys.Date()
    outname = sprintf('outfiles/europepmc_antibody_and_database_%s.csv', current_date)
    write.csv(df, outname, row.names=FALSE)
}


get_papers_affinity = function(){
    df = europepmc::epmc_search(query = '"antibody" and "affinity"', limit=350000)
    print(df)
    current_date = Sys.Date()
    outname = sprintf('outfiles/europepmc_antibody_and_database_and_affinity_%s.csv', current_date)
    write.csv(df, outname, row.names=FALSE)
}


# run stuff
# # get_papers()
get_papers_affinity()
