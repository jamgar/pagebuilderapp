module HeroHelper
  def hero_styles(properties)
    styles = ""
    styles << "background-color:" << properties["background_color"].to_s << ";"
    styles << "color:" << properties["text_color"].to_s << ";"
    styles << "padding-top:" << properties["padding_top"].to_s << "px;"
    styles << "padding-bottom:" << properties["padding_bottom"].to_s << "px;"
    styles << "padding-left:" << properties["padding_left"].to_s << "px;"
    styles << "padding-right:" << properties["padding_right"].to_s << "px;"
    styles
  end
end