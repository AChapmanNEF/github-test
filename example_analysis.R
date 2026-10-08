# example_analysis.R
# -----------------------------------------------------------------------------
# A small practice script for the NEF GitHub session.
#
# It uses 'iris', a dataset that comes built into R, so there is no real
# data here and nothing sensitive. The numbers are for practice only and do
# not say anything about NEF's research.
#
# What it does:
#   1. Looks at the built-in 'iris' dataset (150 flowers from 3 iris species)
#   2. Works out the average sepal length for each species
#   3. Draws a simple bar chart of those averages
# -----------------------------------------------------------------------------


# --- Settings ----------------------------------------------------------------
# Things you might want to change are all in this section.

chart_title  <- "Average sepal length by iris species"
x_label      <- "Species"
y_label      <- "Sepal length (cm)"
bar_colour   <- "#25B49E"   # NEF teal


# --- Prepare the data --------------------------------------------------------

# Take a first look at the data
head(iris)

# Average sepal length (Sepal.Length) for each species
average_sepal_length <- tapply(iris$Sepal.Length, iris$Species, mean)

# Round to one decimal place so the labels are tidy
average_sepal_length <- round(average_sepal_length, 1)

# Show the result in the console
print(average_sepal_length)


# --- Draw the chart ----------------------------------------------------------

bar_positions <- barplot(
  average_sepal_length,
  main   = chart_title,
  xlab   = x_label,
  ylab   = y_label,
  col    = bar_colour,
  border = NA,
  ylim   = c(0, max(average_sepal_length) + 1)
)

# Add the value above each bar
text(
  x      = bar_positions,
  y      = average_sepal_length,
  labels = average_sepal_length,
  pos    = 3
)

# Add a source line under the chart
mtext("Source: R built-in dataset 'iris' (practice data)",
      side = 1, line = 4, adj = 0, cex = 0.8)
