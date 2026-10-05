# example_analysis.R
# -----------------------------------------------------------------------------
# A small practice script for the NEF GitHub session.
#
# It uses 'mtcars', a dataset that comes built into R, so there is no real
# data here and nothing sensitive. The numbers are for practice only and do
# not say anything about NEF's research.
#
# What it does:
#   1. Looks at the built-in 'mtcars' dataset (32 car models from 1974)
#   2. Works out the average fuel economy for cars with 4, 6 and 8 cylinders
#   3. Draws a simple bar chart of those averages
# -----------------------------------------------------------------------------


# --- Settings ----------------------------------------------------------------
# Things you might want to change are all in this section.

chart_title  <- "Average fuel economy by number of cylinders"
x_label      <- "Number of cylinders"
y_label      <- "Miles per gallon"
bar_colour   <- "#25B49E"   # NEF teal


# --- Prepare the data --------------------------------------------------------

# Take a first look at the data
head(mtcars)

# Average miles per gallon (mpg) for each cylinder group
average_mpg <- tapply(mtcars$mpg, mtcars$cyl, mean)

# Round to one decimal place so the labels are tidy
average_mpg <- round(average_mpg, 1)

# Show the result in the console
print(average_mpg)


# --- Draw the chart ----------------------------------------------------------

bar_positions <- barplot(
  average_mpg,
  main   = chart_title,
  xlab   = x_label,
  ylab   = y_label,
  col    = bar_colour,
  border = NA,
  ylim   = c(0, max(average_mpg) + 5)
)

# Add the value above each bar
text(
  x      = bar_positions,
  y      = average_mpg,
  labels = average_mpg,
  pos    = 3
)

# Add a source line under the chart
mtext("Source: R built-in dataset 'mtcars' (practice data)",
      side = 1, line = 4, adj = 0, cex = 0.8)

