class PostsCountOverTime < Avo::Dashboards::ChartkickCard
  self.id = "posts_count_over_time"
  self.label = "Posts count over time"
  self.chart_type = :area_chart
  # self.description = "Some tiny description"
  self.cols = 2
  # self.initial_range = 30
  # self.ranges = [7, 30, 60, 365, "TODAY", "MTD", "QTD", "YTD", "ALL"]
  # self.chart_options = { library: { plugins: { legend: { display: true } } } }
  # self.flush = true

  query do
    result [
      { name: "Posts count over time", data: {
        May: Post.where(created_at: (Time.now - 1.month)..).count,
        April: Post.where(created_at: (Time.now - 2.months)..).count,
        March: Post.where(created_at: (Time.now - 3.months)..).count,
      } },
    ]
  end
end
