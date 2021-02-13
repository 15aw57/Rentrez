#Create vector titled "ncbi_ids" containing three objects
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") 

#Load rentrez library
library(rentrez) 

#Fetch gene sequences using the ids from vector "ncbi_ids"
#Set the database to "nuccore",the format to FASTA, and store the information in an object called "Bburg"
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") 

#Create a new object called Sequences that contains 3 elements: one for each sequence
Sequences = strsplit(Bburg,split = "\n\n")

#Convert sequences to a data frame
Sequences = unlist(Sequences)

#Use regular expressions to separate the sequences from the headers
header = gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) #Separate headers from sequence and name "header"
seq = gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences) #Separate sequence from headers and name "seq"
Sequences = data.frame(Name=header,Sequence=seq) #Have "header" and "seq" appear in a data frame called "Sequences"

#Remove the newline characters from the Sequences data frame using regular expressions
Sequences$Sequence = gsub("\\n","",Sequences$Sequence)
Sequences

#Output this data frame to a file called Sequences.csv.
write.csv(Sequences,"../BIOL 432/Rentrez/Sequences.csv") 
