class PartialCard < Avo::Dashboards::PartialCard
  self.id = "partial_card"
  self.label = "Partial card"
  self.partial = "avo/cards/partial_card"
  self.display_header = false
  self.cols = 3
  self.rows = 3
end
