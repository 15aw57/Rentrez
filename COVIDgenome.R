#Load rentrez library
library(rentrez)

#Fetch the Covid19 genome from Genbank using accession code
Covid = entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")

#Use regular expressions in R to isolate the S protein from the genome you downloaded
#(starts at bp position 21,563 and ends at position 25,384)

#Remove all characters except for nucleotides
Covid = gsub("[^A|C|T|G]", "", Covid)

#Select values at s_protein location
S_protein = substr(Covid, start = 21563, stop = 25384)

#Would you say this gene is highly conserved or evolving rapidly? Why?  
#This gene is likely highly conserved because 3822 results appeared for the gene search, and all of them are highly similar (almost 100%), as is depicted by the graphic summary
#Additionally, the alignment identities of the different Covid strains at this location are 100%, indicating low mutation and evolution
