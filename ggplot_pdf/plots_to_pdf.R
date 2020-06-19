# Prepare libraries
library(forecastML)
library(ggplot2)
library(dplyr)
library(gridExtra)

# Prepare data
data("data_buoy_gaps")
data <- data_buoy_gaps[, 1:3]


# Prepare plots
i <- 1
plot.fig <- list()

for (id in unique(data$buoy_id)) {
  plot.data <- data %>% filter(buoy_id == id)
  local({
    plot.fig[[i]] <<- ggplot(plot.data, aes(x = date, y = wind_spd)) +
      geom_line() +
      ggtitle(paste(id))
  })
  i <- i + 1
}

glist <- lapply(plot.fig, ggplotGrob)

# save plots to pdf files with customized nrows and ncols.
plot.name <- "example_2_by_1.pdf"
ggsave(plot.name, marrangeGrob(glist, top = NULL, nrow = 2, ncol = 1))
plot.name <- "example_2_by_2.pdf"
ggsave(plot.name, marrangeGrob(glist, top = NULL, nrow = 2, ncol = 2))
