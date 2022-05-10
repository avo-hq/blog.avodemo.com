class PostsCount < Avo::Dashboards::MetricCard
  self.id = "posts_count"
  self.label = "Posts count"
  # self.description = "Some description"
  # self.cols = 1
  self.initial_range = 30
  self.ranges = [7, 30, 60, 365, "TODAY", "MTD", "QTD", "YTD", "ALL"]
  # self.prefix = "$"
  # self.suffix = ""
  # self.refresh_every = 1.second

  query do
    # from = Date.today.midnight - 1.week
    # to = DateTime.current

    # if range.present?
    #   if range.to_s == range.to_i.to_s
    #     from = DateTime.current - range.to_i.days
    #   else
    #     case range
    #     when "TODAY"
    #       from = DateTime.current.beginning_of_day
    #     when "MTD"
    #       from = DateTime.current.beginning_of_month
    #     when "QTD"
    #       from = DateTime.current.beginning_of_quarter
    #     when "YTD"
    #       from = DateTime.current.beginning_of_year
    #     when "ALL"
    #       from = Time.at(0)
    #     end
    #   end
    # end

    # result User.where(created_at: from..to).count

    if range.present?
      result Post.where(created_at: (Time.now - range.to_i.days)..).count
    else
      result Post.count
    end
  end
end
