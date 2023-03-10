
# Load necessary packages
library(ape)
library(phangorn)

# Set working directory
#setwd("/path/to/directory/containing/codeml/executable")

# Load alignment file
alignment <- read.dna("alignment_file.fasta", format = "fasta")

# Set up control file for codeml
control_file <- "
      seqfile = alignment_file.fasta
      treefile = tree_file.tree
      outfile = output_file
      verbose = 0
      runmode = 0
      model = 0
      NSsites = 0 1 2 7 8
      fix_omega = 0
      omega = 0.4"

# Write control file to disk
write(control_file, file = "control_file.ctl")

# Set up tree file
tree_file <- read.tree("tree_file.tree")

# Set up codeml command
codeml_command <- "./codeml control_file.ctl"

# Run codeml
system(codeml_command)

# Read in results file
results <- read.table("output_file")

# Extract relevant output (e.g. dN/dS ratios)
dnds_ratios <- results[7, 2:6]

# Output results
dnds_ratios




