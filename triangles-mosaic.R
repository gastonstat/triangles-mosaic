# Title: Triangles Mosaic
# Description: Mosaic with multiple colored triangles
# Author: Gaston Sanchez
# Date: April-10-2024

#-------------------------------------------
# triangles of odd rows
#-------------------------------------------
xs1_up = c(0.0, 0.1, 0.05)
ys1_up = c(0.0, 0.0, 0.1)
xsteps = seq(from = 0.0, to = 1, by = 0.1)
ysteps = seq(from = 0.0, to = 1, by = 0.1)

# inverted triangles
xs1_down = c(0.05, 0.15, 0.1)
ys1_down = c(0.1, 0.1, 0.0)

#-------------------------------------------
# triangles of even rows
#-------------------------------------------
xs2_up = c(0.05, 0.15, 0.1)
ys2_up = c(0.0, 0.0, 0.1)
xsteps = seq(from = 0.0, to = 0.9, by = 0.1)
ysteps = seq(from = 0.0, to = 0.9, by = 0.1)

# inverted triangles
xs2_down = c(0.0, 0.1, 0.05)
ys2_down = c(0.1, 0.1, 0.0)


#-------------------------------------------
# colors
#-------------------------------------------
# base colors for color-scheme
set.seed(15)

bv = runif(100, 0.53, 0.56)
blues = hsv(h = bv, s = 1, v = 1, alpha = runif(100, 0.8, 1))

gv = runif(100, 0.20, 0.25)
greens = hsv(h = gv, s = 1, v = 1, alpha = runif(100, 0.8, 1))

ov = runif(50, 0.10, 0.15)
oranges = hsv(h = ov, s = 1, v = 1, alpha = runif(50, 0.8, 1))

whites = hsv(h = 0, s = 0, v = 1, alpha = runif(100, 0.3, 0.7))

base_cols = c(blues, greens, oranges)

# https://paletton.com/#uid=70p0C0kmcEFbWSvhCLyqIzdv-sG
base_cols = c("#FF964E", "#FFC84E", "#4C69C5", "#3ABEA8")


#----------------------------------------------
# Plot exported to PNG file (dimensions 8x8 in)
#----------------------------------------------
#plot(0.5, 0.5, type = "n", xlim = c(0, 1), ylim = c(0, 1))
png("triangles-mosaic.png", width = 8, height = 8, units="in", res = 300)
op = par(bg = "white", mar = rep(0,4))
plot.new()
plot.window(xlim = c(0, 1), ylim = c(0, 1))
# triangles in odd rows
for (row in c(1, 3, 5, 7, 9)) {
  for (col in 1:10) {
    cols = sample(base_cols, size = 10, replace = TRUE)
    polygon(xs1_up + xsteps[col], ys1_up + ysteps[row], 
            col = cols, border = "white")
  }
  for (col in 1:9) {
    cols = sample(base_cols, size = 9, replace = TRUE)
    polygon(xs1_down + xsteps[col], ys1_down + ysteps[row], 
            col = cols, border = "white")
  }
}
# triangles in even rows
for (row in c(2, 4, 6, 8, 10)) {
  for (col in 1:9) {
    cols = sample(base_cols, size = 9, replace = TRUE)
    polygon(xs2_up + xsteps[col], ys2_up + ysteps[row], 
            col = cols, border = "white")
  }
  for (col in 1:10) {
    cols = sample(base_cols, size = 10, replace = TRUE)
    polygon(xs2_down + xsteps[col], ys2_down + ysteps[row], 
            col = cols, border = "white")
  }
}
par(op)
dev.off()


