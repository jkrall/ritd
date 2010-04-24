module PageHelper

  def reg
    return "<span style='font-size: 10px; position: relative; top: -5px;'>&reg;</span>".html_safe
  end

  def trade
    return "<sup><span style='font-size: 8px; font-style: normal;'>TM</span></sup>".html_safe
  end

end
